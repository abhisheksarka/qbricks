class Flow < ApplicationRecord
  include Conditionable
  belongs_to :site
  has_and_belongs_to_many :steps, -> { order('flows_steps.serial asc') }
  has_many :flows_steps, dependent: :destroy
end
