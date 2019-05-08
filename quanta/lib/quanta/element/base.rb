module Quanta
  module Element
    class Base
      SIGNATURE_ATTRS = %i[id class type name].freeze

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

      def js_selector
        res = ''
        signature_attrs.each do |k, v|
          res += "[#{k}='#{v}']"
        end
        res
      end

      def js_value_validate!(value)
        raise 'ValueMismatchError' if el.value.to_s != value.to_s
      end

      def js_checked_validate!(state)
        raise 'CheckedMismatchError' if el.checked? != state
      end

      def js_set
        raise NotImplementedError
      end

      def browser_client
        @browser_client ||= el.browser
      end
    end
  end
end
