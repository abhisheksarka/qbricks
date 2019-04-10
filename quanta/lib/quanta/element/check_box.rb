module Quanta
  module Element
    class CheckBox < Base
      def set(value)
        value ? el.set : el.clear
        broadcast_change
      end
    end
  end
end