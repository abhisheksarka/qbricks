module Quanta
  module Element
    class Base
      SIGNATURE_ATTRS = %i[id class type].freeze

      attr_accessor :el

      def initialize(el)
        @el = el
      end

      def broadcast_change
        el.fire_event('change')
      end

      def attrs
        el.attributes
      end

      def signature_attrs
        attrs.with_indifferent_access.slice(*SIGNATURE_ATTRS)
      end

      def signature
        {
          el.tag_name.to_sym => signature_attrs
        }
      end
    end
  end
end