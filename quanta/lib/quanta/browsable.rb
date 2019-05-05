module Quanta
  module Browsable
    include Support
    KEYWORD_ORDER = HashWithIndifferentAccess.new(0).merge(nearest: 1, set: 2, js: 3)
    attr_accessor :browsable_config

    def browser_type
      @browser_type ||= browsable_config['browser_type']
    end

    def browser_opts
      @browser_opts ||= {
        # prefs: {
        #   profile: {
        #     default_content_setting_values: {
        #       images: 2
        #     }
        #   }
        # }
      }
    end

    def browser_client
      @browser_client ||= Watir::Browser.new(browser_type.to_sym, options: browser_opts)
    end

    def goto(config)
      config = format_config(config)
      browser_client.goto(config['url'])
    end

    # Sample - { input: { id: 'foo' }, set: 'bar', js: true/false }
    def mset(config)
      config = format_config(config)
      el = wrap_el(find_by_config(config))
      if config['js']
        el.js_set(config['set'])
      else
        el.set(config['set'])
      end
      config
    end

    # Sample - { button: { id: 'foo' } }
    def mclick(config)
      config = format_config(config)
      find_by_config(config).click
      config
    end

    # Sample - { label: 'Foo', nearest: 'text_field', set: 'bar', js: true/false }
    def nset(nearest_config)
      nearest_config = format_config(nearest_config)
      el = wrap_el(find_by_nearest(nearest_config))
      if nearest_config['js']
        el.js_set(nearest_config['set'])
      else
        el.set(nearest_config['set'])
      end
      nearest_config
    end

    # Sample - { label: 'Foo', nearest: 'button' }
    def nclick(nearest_config)
      nearest_config = format_config(nearest_config)
      find_by_nearest(nearest_config).click
      nearest_config
    end

    def script(js_script, *args)
      browser_client.execute_script(js_script, *args)
    end

    private

    def format_config(config)
      HashWithIndifferentAccess.new(
        config.sort_by { |k, _v| KEYWORD_ORDER[k] }.to_h
      )
    end

    def wrap_el(el)
      Element::KLASS_MAP[el.class].new(el)
    end

    # Sample config: { div: { id: 'hello' } }
    def find_by_config(config, doc = browser_client)
      el = doc.send(config.keys[0], config.values[0].symbolize_keys).to_subtype
      el.scroll.to(:center)
      el
    end

    # Sample text_config: { label: 'Enter email' }
    def find_by_text(text_config, doc = browser_client)
      config = {
        text_config.keys[0] => {
          visible_text: text_config.values[0]
        }
      }
      find_by_config(config, doc)
    end

    # Sample nearest_config: { label: 'Foo', nearest: 'text_field', val: 'bar' }
    # Sample nearest_config: { label: { class: 'form-label', visible_text: 'Bar' }, nearest: 'text_field', val: 'bar' }
    def find_by_nearest(nearest_config, doc = browser_client)
      val = nearest_config.values[0]
      start_node = if val.is_a? ::String
                     find_by_text(nearest_config, doc)
                   else
                     find_by_config(nearest_config.keys[0] => val)
                   end
      recursive_lookup(start_node, nearest_config[:nearest], doc)
    end

    def recursive_lookup(node, lookup, doc = browser_client, depth = 0)
      return if depth > MAX_LOOKUP_DEPTH

      depth += 1

      return unless node

      el = node.send(lookup.to_sym, { index: 0 }).wait_until(timeout: 0)
      el.exists? ? el.to_subtype : recursive_lookup(node.parent, lookup, doc, depth)
    end
  end
end