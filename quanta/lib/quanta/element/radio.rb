module Quanta
  module Element
    class Radio < Base
      def set(value)
        return unless value

        el.set
        broadcast_change
      end

      def js_set(value)
        return unless value

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