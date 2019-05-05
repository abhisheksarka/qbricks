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
        js_value_validate!(value)
        broadcast_change
      end
    end
  end
end
