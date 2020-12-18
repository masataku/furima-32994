require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end  
  describe "商品出品機能のテスト" do
    context "商品の出品がうまくいくとき" do
      it "①全てのフォームが空ではない
          ②販売価格が半角数字で300以上9999999以下
          ③カテゴリー,商品の状態,配送料の負担,発送元の地域,発送までの日数,販売価格 は --- 以外が選ばれている" do
        expect(@item).to be_valid  
      end   
    end  

    context "商品の出品がうまくいかないとき" do
      it "出品画像 が空" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end  
      it "商品名 が空" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end 
      it "商品の説明 が空" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end 
      it "カテゴリー が空" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end 
      it "カテゴリー の --- が選ばれる" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end 
      it "商品の状態 が空" do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end 
      it "商品の状態 の --- が選ばれる" do
        @item.state_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end 
      it "配送料の負担 が空" do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end   
      it "配送料の負担 の --- が選ばれる" do
        @item.shipping_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end 
      it "発送元の地域 が空" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end   
      it "発送元の地域 の --- が選ばれる" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end 
      it "発送までの日数 が空" do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end 
      it "発送までの日数 の --- が選ばれる" do
        @item.shipping_date_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end 
      it "販売価格 が空" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end 
      it "販売価格が300より小さい" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end      
      it "販売価格が9999999より大きい" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end 
      it "販売価格が全角数字" do
        @item.price = "６００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end 
      it "販売価格が全角文字" do
        @item.price = "あいう"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end 
      it "販売価格が半角文字" do
        @item.price = "abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end 
    end   
  end  
end
