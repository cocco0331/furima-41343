require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end

  describe '商品出品' do
    context '出品できる時' do
      it '全ての項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
  end

  context '出品できない時' do
    it '画像がないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'item_nameが空だと出品できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'descriptionが空だと出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'category_idが---だと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'product_condition_idが---だと出品できない' do
      @item.product_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Product condition can't be blank")
    end
    it 'shipping_cost_idが---だと出品できない' do
      @item.shipping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
    end
    it 'shipping_date_idが---だと出品できない' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end
    it 'delivery_region_idが---だと出品できない' do
      @item.delivery_region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery region can't be blank")
    end
    it 'priceが空だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが300未満だと出品できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceが9999999より上だと出品できない' do
      @item.price = 99_999_999
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it 'priceがに半角数字以外が含まれている場合は出品できない' do
      @item.price = '１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'userが紐付いていなければ出品できない' do
      @item.user_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")
    end
  end
end
