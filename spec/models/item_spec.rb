require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品登録できない' do
    it 'imageが空では保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'titleが空では保存できない' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it 'infoが空では保存できない' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end
    it 'カテゴリーが---では保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態が---では保存できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it '配送料の負担が---では保存できない' do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping can't be blank")
    end
    it '発送元の地域が---では保存できない' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    it '発送元の日数が---では保存できない' do
      @item.delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery can't be blank")
    end
    it '価格が空では保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が全角文字では保存できない' do
      @item.price = 'あ'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '価格が英字では保存できない' do
      @item.price = 'a'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '価格がカタカナでは保存できない' do
      @item.price = 'ア'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '価格が全角数字では保存できない' do
      @item.price = '１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '価格が記号では保存できない' do
      @item.price = '@¥?'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '価格が300未満では保存できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格が9999999以上では保存できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
