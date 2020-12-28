require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '商品購入機能' do
    before do
      @order_shipping = FactoryBot.build(:order_shipping)
    end
    
    context '商品購入ができるとき' do
      it 'すべての値が正しく入力されていれば商品購入できること' do
        expect(@order_shipping).to be_valid
      end
    end
    context '商品購入ができないとき' do
      it '郵便番号が空では商品購入できない' do
        @order_shipping.post = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include( "Post can't be blank" )
      end
      it '都道府県が空では商品購入できない' do
        @order_shipping.area_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include( "Area must be other than 1" )
      end
      it '市区町村が空では商品購入できない' do
        @order_shipping.city = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include( "City can't be blank" )
      end
      it '番地が空では商品購入できない' do
        @order_shipping.address = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include( "Address can't be blank" )
      end
      it '電話番号が空では商品購入できない' do
        @order_shipping.tel = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include( "Tel can't be blank" )
      end
      it '郵便番号にハイフンがないと商品購入できない' do
        @order_shipping.post = '1111111'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include( "Post ハイフンをつけて数字7文字で入力してください" )
      end
      it '郵便番号が7文字でないと商品購入できない' do
        @order_shipping.post = '111-111'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include( "Post ハイフンをつけて数字7文字で入力してください" )
      end
      it '電話番号はハイフンがあると商品購入できない' do
        @order_shipping.tel = '090-1111-1111'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include( "Tel はハイフンは不要で0から始まる10桁または11桁の半角数字で入力してください" )
      end
      it '電話番号は12桁以上では商品購入できない' do
        @order_shipping.tel = '011111111111'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include( "Tel はハイフンは不要で0から始まる10桁または11桁の半角数字で入力してください" )
      end
      it '電話番号は9桁以下では商品購入できない' do
        @order_shipping.tel = '011111111'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include( "Tel はハイフンは不要で0から始まる10桁または11桁の半角数字で入力してください" )
      end
      it 'tokenが空では商品購入できない' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include( "Token can't be blank" )
      end
    end
  end
end
