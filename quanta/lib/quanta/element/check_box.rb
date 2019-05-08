module Quanta
  module Element
    class CheckBox < Base
      def set(value)
        value.eql?('false') ? el.clear : el.set
        broadcast_change
      end

      def js_set(value)
        value = value.eql?('false') ? false : true
        browser_client.execute_script(
          %{
            $("#{js_selector}").prop("checked",#{value})
          }.strip
        )
        js_checked_validate!(value)
        broadcast_change
      end
    end
  end
end
