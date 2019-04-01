class Site < ApplicationRecord
  has_many :flows
  has_many :steps
  has_one :datamap

  accepts_nested_attributes_for :datamap
end
