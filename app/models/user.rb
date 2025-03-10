class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependant: :destroy

  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with:  URI::MailTo::EMAIL_REGEXP }
  validates :photo, presence: true
end
