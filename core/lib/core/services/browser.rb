module Core
  module Services
    class Browser
      include Quanta::Browsable
      attr_accessor :site,
                    :dataset,
                    :datamap,
                    :params

      def initialize(site, dataset)
        @site = site
        @browsable_config = site.config.with_indifferent_access
        @dataset = dataset
        @datamap = site.datamap
        @params = Quanta::HashMapped.new(@dataset, (@datamap || {}))
        @site.dataset = dataset
      end

      def run!
        site.flows.each do |flow|
          next unless flow.execute?(binding)

          flow.steps.each do |step|
            next unless step.execute?(binding)

            send(step.step_type, step.interpolated_config(binding))
          end
        end
      end
    end
  end
end
