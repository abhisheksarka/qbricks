module Quanta
  module Element
    class TextField < Base
      def set(value)
        el.set(value)
        broadcast_change
      end

      def js_set(value)
        browser_client.execute_script(
          %{
            $("#{js_selector})").val("#{value}")
          }.strip
        )
        broadcast_change
      end
    end
  end
end
