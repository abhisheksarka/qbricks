module Quanta
  module Support
    # This module provides a namespace
    # for all classes/modules that define
    # support methods String manipulation
    #
    # Author::    Abhishek Sarkar(abhishek@qubricks.com)
    # Copyright:: Copyright (c) 2018 Qubricks
    # License::   Proprietary
    module String
      class << self
        def fuzzy_match(s1, s2)
          _fuzzy_matcher.getDistance(clean(s1), clean(s2))
        end

        def inclusion_score(s1, s2)
          score = 0
          arr1 = s1.split(/\W+/)
          arr2 = s2.split(/\W+/)

          arr2.each { |s| score += 1 if arr1.include?(s) }
          (score.to_f/arr2.length.to_f).round(2)
        end

        def clean(s)
          s.try(:downcase).try(:strip)
        end

        def _fuzzy_matcher
          @fuzzy_str_match ||= FuzzyStringMatch::JaroWinkler.create(:pure)
        end
      end

      def fuzzy_match(s1, s2)
        String.fuzzy_match(s1, s2)
      end

      def clean(s)
        String.clean(s)
      end

      def inclusion_score(s1, s2)
        String.inclusion_score(s1, s2)
      end
    end
  end
end
