require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    it "imageが空では登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空では登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "explanationが空では登録できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it "category_idが空では登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "condition_idが空では登録できない" do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it "shipping_charges_idが空では登録できない" do
      @item.shipping_charges_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
    end

    it "prefecture_idが空では登録できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "days_idが空では登録できない" do
      @item.days_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Days can't be blank")
    end

    it "priceが空では登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが300円未満だと登録できない" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

    it "priceが9999999円より大きいと登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
  end
end
