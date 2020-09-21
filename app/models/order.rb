class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :address

  with_options presence: true do
    validates :card_num
    validates :cvc
    validates :exp_month
    validates :exp_year
    validates :post_code
    validates :address
    validates :city
    validates :phone_num
    end
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_num, format: {/^(0{1}\d{9,10})$/, message: "is invalid. Without hyphen(-)"}
end
