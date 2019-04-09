module Quanta
  module Element
    class TextField < Base
      def set(value)
        el.set(value)
        broadcast_change
      end
    end
  end
end