class Step < ApplicationRecord
  include Conditionable
  include Interpolatable

  belongs_to :site
  has_and_belongs_to_many :flows

  def interpolated_config(binding = nil)
    JSON.parse(
      interpolate(config.to_json_ea, binding)
      .gsub('"[', '[')
      .gsub(']"', ']')
    ).with_indifferent_access
  end

  class << self
    def step_types
      %w[nset nclick goto mset mclick jclick jset]
    end
  end
end
