class OrderAddress

  include ActiveModel::Model
  attr_accessor :name, :user_id, :token, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_num
  def save
    # 注文の情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, address: address, city: city, building_name: building_name, phone_num: phone_num)
  end
end