require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品出品ができるとき' do
      it 'フォームが全て埋まっていれば出品できる' do
        
      end
    end
  end
end
