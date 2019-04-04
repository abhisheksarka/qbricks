class Site < ApplicationRecord
  attr_accessor :dataset
  has_many :flows
  has_many :steps
end
