require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it 'post_codeが空だと保存できないこと' do
      @order_address.post_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.post_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @order_address.address = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
    it 'phone_numが空だと保存できないこと' do
      @order_address.phone_num = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
    end
    it 'phone_numにハイフンがあると保存できないこと' do
      @order_address.phone_num = '111-222-333'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone num is invalid. Input half-width characters")
    end
    it 'phone_numが12文字以上だと保存できないこと' do
      @order_address.phone_num = '111122223333'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone num is too long (maximum is 11 characters)")
    end
  end
end
