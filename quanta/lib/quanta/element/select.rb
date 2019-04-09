module Quanta
  module Element
    class Select < Base
      def set(value)
        el.select(value)
        broadcast_change
      end
    end
  end
end