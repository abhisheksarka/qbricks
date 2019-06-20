class Site < ApplicationRecord
  attr_accessor :dataset
  has_many :flows
  has_many :steps
  has_many :site_credentials
end
