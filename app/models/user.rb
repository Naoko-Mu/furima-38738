class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
    with_options presence: true do

  validates :nickname
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true }
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, allow_blank: true }
  validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, allow_blank: true }
  validates :birthday
    end

  has_many :items
  has_many :orders
end
