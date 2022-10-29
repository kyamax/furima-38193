require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報登録ができる場合' do
      it '全ての項目が指定通りのデータが入力されていれば、登録できる' do
        expect(@order_form).to be_valid
      end
      it 'address2が空でも登録できる' do
        @order_form.address2 = nil
        expect(@order_form).to be_valid
      end
    end

    context '商品登録ができない場合' do
      it 'tokenが空では登録できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では登録できない' do
        @order_form.post_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが数字3文字-数字4文字の組み合わせでないと登録できない' do
        @order_form.post_code = 'asddfd'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Post code input correctly')
      end
      it 'prefectureに「---」が選択されている場合は登録できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it 'address1が空では登録できない' do
        @order_form.address1 = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address1 can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では登録できない' do
        @order_form.phone_number = '1111111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number input correctly')
      end
      it 'phone_numberが12桁以上では登録できない' do
        @order_form.phone_number = '111111111111111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number input correctly')
      end
      it 'phone_numberが半角数字以外が含まれている場合は登録できない' do
        @order_form.phone_number = '1あかい11'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number input correctly')
      end
      it 'userが紐づいていないと登録できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと登録できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
