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
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :price
    validates :estimated_shipping_id
    validates :postage_fee_id
  end
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :estimated_shipping_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :postage_fee_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, numericality: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end

