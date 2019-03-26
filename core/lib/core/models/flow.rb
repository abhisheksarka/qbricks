class Flow < ApplicationRecord
  include Conditionable
  belongs_to :site
  has_and_belongs_to_many :steps
end
