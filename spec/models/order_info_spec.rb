require 'rails_helper'

RSpec.describe OrderInfo, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_info = FactoryBot.build(:order_info, user_id: user.id, item_id: item.id)
  end

  describe '購入機能' do
    context '購入できる場合' do
      it 'すべての値が存在していれば保存できる' do
        expect(@order_info).to be_valid
      end
      it '建物が空でも保存できる' do
        @order_info.building = ''
        expect(@order_info).to be_valid
      end
    end
    context '購入できない場合' do
      it 'userが紐付いていないと保存できない' do
        @order_info.user_id = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @order_info.item_id = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空で保存できない' do
        @order_info.postal_code = ''
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号の値が三桁数字ハイフン四桁数字でないので保存できない' do
        @order_info.postal_code = '123-456'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include('Postal code is invalid')
      end
      it '発送元の地域が---では保存できない' do
        @order_info.area_id = 1
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空で保存できない' do
        @order_info.city = ''
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空で保存できない' do
        @order_info.address = ''
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空で保存できない' do
        @order_info.phone_number = ''
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が数字でないので保存できない' do
        @order_info.phone_number = 'test'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include('Phone number is not a number')
      end
      it '電話番号の桁数が10桁未満なので保存できない' do
        @order_info.phone_number = '090123456'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include('Phone number number is too short')
      end
      it 'tokenが空では登録できない' do
        @order_info.token = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
