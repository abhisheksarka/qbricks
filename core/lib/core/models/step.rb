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
      %w[goto m_set m_click js_click js_set js_autocomplete]
    end
  end
end
