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
  belongs_to :company
  before_create :set_company

  private

  def set_company
    cname = email.split('@')[-1].strip.downcase
    self.company = Company.find_or_create_by(cname: cname)
  end
end
