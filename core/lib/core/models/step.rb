class Step < ApplicationRecord
  include Conditionable
  include Interpolatable
  default_scope { order('serial asc') }

  belongs_to :site
  has_and_belongs_to_many :flows

  def interpolated_config(binding = nil)
    JSON.parse(interpolate(config.to_json_ea, binding)).with_indifferent_access
  end

  class << self
    def step_types
      %w[nset nclick goto mset mclick]
    end
  end
end
