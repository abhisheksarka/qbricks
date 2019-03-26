class Step < ApplicationRecord
  include Conditionable
  include Interpolatable
  belongs_to :site
  has_and_belongs_to_many :flows

  def interpolated
    res = { }.with_indifferent_access
    config.each do |k, v|
      res[k] = interpolate(v)
    end
  end

  class << self
    def step_types
      ['auto_set', 'auto_click', 'goto', 'man_set', 'man_click']
    end
  end
end
