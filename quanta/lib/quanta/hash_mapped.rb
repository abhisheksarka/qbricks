module Quanta
  ######################################################################
  # Usage
  ######################################################################
  # datamap = {
  # ## Declare variables that can be used withing the map
  #   _var_: {
  #     "area_value": {
  #       "sq-ft": "square-feet"
  #     }
  #   },
  #
  #
  # ## Map carpet_area.value(using variable mapping)
  #   carpet_area: {
  #     value: {
  #       "_var_": "area_value"
  #     }
  #   },
  #
  # ## Map covered_area.value(using variable mapping)
  #   covered_area: {
  #     value: {
  #       "_var_": "area_value"
  #     }
  #   },
  #
  # ## Map age(using range mapping)
  #   age: {
  #     _r_: {
  #       "..5": "Less than 5 years",
  #       "5..10": "5 to 10 years",
  #       "10..": "greater than 10 years"
  #     },
  #     _wc_one_wc_: "Less than 5 years"
  #   },
  # ## Map city(using wild card, standard and default mapping)
  #   city: {
  #     Bangalore: 'Bengaluru',
  #     Gurgaon: 'Gurugram',

  #     # Default when `city` is nil
  #     _d_: 'No City',
  #     # Wild Card when `city` is like Delhi
  #     _wc_Delhi_wc_: 'New Delhi'
  #   }
  # }

  # # No Mapping
  # res = Quanta::HashMapped.new({ city: 'Noida' }, datamap)
  # res['city'] # Noida

  # # Standard Mapping
  # res = Quanta::HashMapped.new({ city: 'Bangalore' }, datamap)
  # res['city'] # Bengaluru

  # # Wild Card Mapping
  # res = Quanta::HashMapped.new({ city: 'South Delhi' }, datamap)
  # res['city'] # New Delhi

  # # Default Mapping
  # res = Quanta::HashMapped.new({}, datamap)
  # res['city'] # No City

  # # Range Mapping
  # res = Quanta::HashMapped.new({age: 1}, datamap)
  # res['age'] # Less than 5 years

  # # Variable Mapping
  # res = Quanta::HashMapped.new({carpet_area: {value: 'sq-ft'}}, datamap)
  # res['carpet_area']['value'] # square-feet
  ######################################################################

  class HashMapped < HashWithIndifferentAccess
    KEYWORDS = {
      default: '_d_',
      wild_card: '_wc_',
      range: '_r_',
      var: '_var_'
    }.freeze

    VAR_SEPARATOR = '.'
    WILD_CARD_REGEX = '.{0,}'.freeze
    RANGE_SEPARATOR = '..'.freeze
    STRUCTURES = [Hash].freeze

    attr_accessor :hash,
                  :mapped,
                  :vars

    def initialize(hash, mapped, vars = nil)
      @hash = hash
      @mapped = (mapped || {}).with_indifferent_access
      @vars = (vars || @mapped[KEYWORDS[:var]]) || {}
      super(hash)
    end

    def [](key)
      val = super(key)
      if struct?(val)
        HashMapped.new(val, mapped[key], @vars)
      else
        val = val.to_s unless [true, false].include? val
        map = mapped[key]
        if map.present?
          apply(map, val)
        else
          val
        end
      end
    end

    private

    def apply(hash, key)
      hash_keys = hash.keys
      apply_standard(hash, hash_keys, key) ||
        apply_variables(hash, hash_keys, key) ||
        apply_range(hash, hash_keys, key) ||
        apply_wildcard(hash, hash_keys, key) ||
        apply_default(hash, hash_keys, key)
    end

    def apply_standard(hash, hash_keys, key)
      hash[key.to_s] if hash_keys.include? key.to_s
    end

    def apply_default(hash, hash_keys, key)
      return key if key.present?

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

    def apply_range(hash, _hash_keys, key)
      range = hash[KEYWORDS[:range]]
      return unless range

      key = key.to_f if key.to_s =~ /\d/
      key_class = key.class

      res = nil
      range.each do |k, v|
        s = k.split('..')
        start = s[0]
        endd = s[1]
        next if start.blank? && endd.blank?

        start = start.to_f if start =~ /\d/
        endd = endd.to_f if endd =~ /\d/

        exp = if start.blank? && endd.is_a?(key_class)
                key <= endd
              elsif endd.blank? && start.is_a?(key_class)
                key >= start
              else
                start.is_a?(key_class) && endd.is_a?(key_class) && key >= start && key <= endd
              end
        if exp
          res = v
          break
        end
      end
      res
    end

    def apply_variables(hash, hash_keys, key)
      return unless hash_keys.include? KEYWORDS[:var]

      var_key = hash[KEYWORDS[:var]]
      vars[var_key][key]
    end

    def struct?(val)
      return false if val.nil?

      STRUCTURES.map { |s| val.is_a? s }.reduce(:|)
    end
  end
end
