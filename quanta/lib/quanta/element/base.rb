module Quanta
  module Element
    class Base
      attr_accessor :el

      def initialize(el)
        @el = el
      end

      def broadcast_change
        el.fire_event('change')
      end
    end
  end
end