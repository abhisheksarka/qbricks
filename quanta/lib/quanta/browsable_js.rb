module Quanta
  module BrowsableJs
    include BrowsableBase

    def goto(config)
      config = before_exec(config)
      browser_client.goto(config['url'])
      after_exec(config)
      config
    end

    # Sample - { input: { id: 'foo' }, set: 'bar', js: true/false, body_click: true/false }
    def js_click(config)
      config = js_before_exec(config)
      js_selector = js_selector_from_config(config)
      js_validate_presence!(js_selector)
      script("#{js_selector}.click()")
      config
    end

    # Sample - { button: { id: 'foo' }, triggers: [] }
    def js_set(config)
      config = js_before_exec(config)
      js_selector = js_selector_from_config(config)
      js_validate_presence!(js_selector)
      script("#{js_selector}.val('#{config[:set]}')")

      (config[:triggers] || []).each do |t|
        js_trigger_event(js_selector, t)
      end

      js_validate_value!(js_selector, config[:set])
      config
    end

    # Sample - { input: { id: 'city' }, set: 'Bangalore', autocomplete: { ul: { id: 'list' }, items: 'li', before_wait: 5 } }
    def js_autocomplete(config)
      js_set(config)
      aconfig = js_before_exec(config[:autocomplete])
      sleep(aconfig[:before_wait].to_i)

      js_selector = js_selector_from_config(aconfig)
      js_validate_presence!(js_selector)

      js_items_selector = "#{js_selector}.children('#{aconfig[:items]}:contains(#{config[:set]})')"
      js_validate_presence!(js_items_selector)
      js_trigger_event(js_items_selector, 'click')
      config
    end

    private

    def js_before_exec(config)
      HashWithIndifferentAccess.new(
        config.sort_by { |k, _v| KEYWORD_ORDER[k] }.to_h
      )
    end

    def js_after_exec(config)
      sleep(config[:after_wait].to_i) if config[:after_wait]
    end

    def js_selector_from_config(config)
      %{
        $("#{config.keys[0]}#{config.values[0].to_jquery_selector}")
      }.strip
    end

    def js_validate_presence!(js_selector)
      raise 'JsElementNotFoundError' if script("return #{js_selector}.length") < 1
    end

    def js_validate_value!(js_selector, value)
      raise 'JsValueMismatchError' if script("return #{js_selector}.val()") != value
    end

    def js_trigger_event(js_selector, event_name)
      script("#{js_selector}.trigger('#{event_name}')")
    end

    def wait(max = 30)
      i = 0
      while !browser_client.execute_script('return $.isReady') && (i <= max)
        sleep(1)
        i += 1
      end
      raise 'DOMReadyFailed' if i > 30 && !browser_client.execute_script('return $.isReady')

      true
    end

    def script(js_script, *args)
      wait
      super(js_script, *args)
    end
  end
end
