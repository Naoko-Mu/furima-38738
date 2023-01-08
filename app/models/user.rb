class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
# with_optionsは複数のバリデーションをグループ化し、共通の制限をかけるためのメソッドです。最後に修正する
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, allow_blank: true }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, allow_blank: true }
  validates :birthday, presence: true

  has_many :items
  has_many :orders
end
