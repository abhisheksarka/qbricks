class Company < ApplicationRecord
  validates :cname, presence: true
  has_many :users
end
