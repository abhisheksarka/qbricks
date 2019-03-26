class Site < ApplicationRecord
  has_many :flows
  has_many :steps
  has_one :datamap
end
