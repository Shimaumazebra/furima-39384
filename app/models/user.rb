class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :name
    validates :email
    validates :date_of_birth
    validates :password, format: { with: /\A[a-z0-9]+\z/i, message: 'is invalid. Input half-width characters.' }
    validates :password_confirmation, format: { with: /\A[a-z0-9]+\z/i, message: 'is invalid. Input half-width characters.'}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.'}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.'}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.'}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.'}
  end
end
