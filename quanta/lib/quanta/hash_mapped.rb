module Quanta
  class HashMapped < HashWithIndifferentAccess
    KEYWORDS = {
      default: '__default'
    }

    STRUCTURES = [
      Hash
    ]
    attr_accessor :hash, :mapped

    def initialize(hash, mapped)
      @hash = hash
      @mapped = mapped.with_indifferent_access
      super(hash)
    end

    def [](key)
      val = super(key)
      return if !val

      if is_a_struct?(val)
        HashMapped.new(val, mapped[key])
      else
        apply_default(mapped[key], val)
      end
    end


    def apply_default(hash, key)
      keys = hash.keys
      return hash[key.to_s] if keys.include? key.to_s
      return hash[KEYWORDS[:default]] if keys.include? KEYWORDS[:default]
    end

    def is_a_struct?(val)
      STRUCTURES.map { |s| val.is_a? s }.reduce(:|)
    end
  end
end