class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :estimated
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture


  belongs_to :user
  has_one   :perchases
  has_one_attached :image


end
