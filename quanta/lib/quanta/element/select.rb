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
        js_value_validate!(value)
        broadcast_change
      end

      def js_value_validate!(value)
        v = nil
        el.options.each do |opt|
          v = opt.text if opt.selected?
        end
        raise 'ValueMismatchError' if v.to_s != value.to_s
      end
    end
  end
end
