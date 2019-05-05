module Quanta
  module Element
    class Select < Base
      def set(value)
        el.select(value)
        broadcast_change
      end

      def js_set(value)
        browser_client.execute_script(
          %{
            $("#{js_selector} option:contains('#{value}')").attr('selected', 'selected')
          }.strip
        )
        broadcast_change
      end
    end
  end
end
