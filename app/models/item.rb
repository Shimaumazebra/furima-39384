class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :estimated
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture

  belongs_to :user
  has_one    :perchase
  has_one_attached :image

  with_options presence: true do
    validates :user_id
    validates :name
    validates :image
    validates :description
  with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :prefecture_id
      validates :estimated_shipping_id
      validates :postage_fee_id
    end
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.'}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range'}
  end
end
