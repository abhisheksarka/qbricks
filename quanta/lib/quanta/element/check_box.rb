module Quanta
  module Element
    class CheckBox < Base
      def set(value)
        value ? el.set : el.clear
        broadcast_change
      end

      def js_set(value)
        browser_client.execute_script(
          %{
            $("#{js_selector})").prop("checked",#{value.present?})
          }.strip
        )
        broadcast_change
      end
    end
  end
end
