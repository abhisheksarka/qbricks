class Company < ApplicationRecord
  validates :cname, presence: true
  has_many :users
  has_many :site_credentials
end
