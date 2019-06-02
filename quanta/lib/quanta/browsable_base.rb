module Quanta
  module BrowsableBase
    include Support
    KEYWORD_ORDER = HashWithIndifferentAccess.new(0).merge(
      nearest: 1,
      set: 2,
      js: 3,
      body_click: 4,
      after_wait: 5,
      before_wait: 6,
      complete: 7,
      items: 8,
      triggers: 9
    )
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

    def script(js_script, *args)
      browser_client.execute_script(js_script, *args)
    end
  end
end
