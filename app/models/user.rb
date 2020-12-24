class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EMAIL_REGEX = /\A\S+@\S+\.\S+\z/.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :email,    format: { with: EMAIL_REGEX,    message: 'には@を含めてください' }
  validates :password, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }
  validates :last_name,       presence: true, format: { with: NAME_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください'}
  validates :first_name,      presence: true, format: { with: NAME_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください'}
  validates :last_name_kana,  presence: true, format: { with: KANA_REGEX, message: 'は全角カタカナで入力してください' }
  validates :first_name_kana, presence: true, format: { with: KANA_REGEX, message: 'は全角カタカナで入力してください' }
  validates :nickname,        presence: true
  validates :birthday,        presence: true
end
