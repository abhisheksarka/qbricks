class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable

  validates :phone_number, uniqueness: true, presence: true
  validates :country_code, inclusion: { in: %w[+91] }
  validates :full_name, presence: true
end
