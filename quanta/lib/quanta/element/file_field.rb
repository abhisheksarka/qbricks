module Quanta
  module Element
    class FileField < Base
      def set(value)
        el.set(Support::File.remote_to_local(value).path)
        broadcast_change
      end
    end
  end
end
