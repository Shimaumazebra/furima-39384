require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id:@user.id)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end
    it 'user_idが空だと保存できないこと' do
      @item.user_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it 'nameが空だと保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'descriptionが空だと保存できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'categoryを選択していないと保存できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'conditionを選択していないと保存できないこと' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'priceが空だと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが全角数字だと保存できないこと' do
      @item.price = '３０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
    end
    it 'priceが300円未満では保存できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it 'priceが9,999,999を超過すると保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it 'estimated_shippingを選択していないと保存できないこと' do
      @item.estimated_shipping_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Estimated shipping can't be blank")
    end
    it 'postage_feeを選択していないと保存できないこと' do
      @item.postage_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage fee can't be blank")
    end
  end
end
