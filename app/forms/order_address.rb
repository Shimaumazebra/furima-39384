class OrderAddress

  include ActiveModel::Model
  attr_accessor :name, :order_id, :user_id, :token, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_num
  
  with_options presence: true do
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :address
    validates :city
    validates :phone_num, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  end
 
  def save
    # 注文の情報を保存
    order = Order.create!(user_id: user_id, item_id: item_id)
    Address.create!(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, address: address, city: city, building_name: building_name, phone_num: phone_num)
  end
end