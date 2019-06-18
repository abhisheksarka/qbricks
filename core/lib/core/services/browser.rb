module Core
  module Services
    class Browser
      include Quanta::BrowsableRb
      include Quanta::BrowsableJs

      attr_accessor :site,
                    :dataset,
                    :datamap,
                    :params

      def initialize(site, dataset)
        @site = site
        @browsable_config = site.config.with_indifferent_access
        @dataset = dataset.with_indifferent_access
        @datamap = site.datamap
        @params = Quanta::HashMapped.new(@dataset, (@datamap || {}))
        @site.dataset = dataset
      end

      def run!
        site.flows.each do |flow|
          next unless flow.execute?(binding)

          flow.steps.each do |step|
            next unless step.execute?(binding)

            iconfig = step.interpolated_config(binding)
            script = step.script

            send(step.step_type, iconfig) if iconfig.present?
            send('script', step.script, params) if script.present?
          end
        end
      end
    end
  end
end
