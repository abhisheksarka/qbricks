module Quanta
  class HashMapped < HashWithIndifferentAccess
    KEYWORDS = {
      default: '_d_',
      wild_card: '_wc_'
    }.freeze
    WILD_CARD_REGEX = '.{0,}'
    STRUCTURES = [Hash].freeze

    attr_accessor :hash,
                  :mapped

    def initialize(hash, mapped)
      @hash = hash
      @mapped = (mapped || {}).with_indifferent_access
      super(hash)
    end

    def [](key)
      val = super(key)
      if struct?(val)
        HashMapped.new(val, mapped[key])
      else
        map = mapped[key]
        apply(map, val) if map.present?
      end
    end

    private

    def apply(hash, key)
      hash_keys = hash.keys
      apply_standard(hash, hash_keys, key) || apply_wildcard(hash, hash_keys, key) || apply_default(hash, hash_keys, key)
    end

    def apply_standard(hash, hash_keys, key)
      hash[key.to_s] if hash_keys.include? key.to_s
    end

    def apply_default(hash, hash_keys, _key)
      hash[KEYWORDS[:default]] if hash_keys.include? KEYWORDS[:default]
    end

    def apply_wildcard(hash, _hash_keys, key)
      kwc = KEYWORDS[:wild_card]
      found = nil
      hash.each do |k, _v|
        if k.include?(kwc) && (/#{k.gsub(kwc, WILD_CARD_REGEX)}/ =~ key).present?
          found = k
          break
        end
      end
      hash[found] if found
    end

    def struct?(val)
      return false if val.nil?

      STRUCTURES.map { |s| val.is_a? s }.reduce(:|)
    end
  end
end