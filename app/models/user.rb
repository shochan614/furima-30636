class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[A-z])(?=.*?[\d])[A-z\d]+\z/i.freeze # 半角英数混合1字以上
  ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze # 全角ひらカタ漢字
  KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze # 全角カナ

  validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }
  with_options presence: true do
    validates :nickname, uniqueness: true
    validates :first_name, format: { with: ZENKAKU_REGEX }
    validates :last_name, format: { with: ZENKAKU_REGEX }
    validates :first_name_kana, format: { with: KANA_REGEX }
    validates :last_name_kana, format: { with: KANA_REGEX }
    validates :birthday
  end

  has_many :items
end
