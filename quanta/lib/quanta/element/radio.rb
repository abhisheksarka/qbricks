module Quanta
  module Element
    class Radio < Base
      def set(value)
        return unless value

        el.set
        broadcast_change
      end
    end
  end
end