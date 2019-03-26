module Core
  class Browser
    include Quasi::Browsable
    attr_accessor :site,
                  :data,
                  :mdata


    def initialize(site, dataset)
      @site = site
      @browsable_config = site.config.with_indifferent_access
      @data = dataset
      @mdata = HashMapped.new(dataset, site.datamap || {})
    end

    def run
      site.flows.each do |flow|
        if flow.execute?
          flow.steps.each do |step|
            if step.execute?
              self.send(step.step_type, step.config)
            end
          end
        end
      end
    end
  end
end
