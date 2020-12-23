require 'rails_helper'
 
RSpec.describe OrderAddress, type: :model do
  describe "商品購入機能" do
    before do
      @order_address = FactoryBot.build(:order_address)
    end  
    context "商品の購入がうまくいくとき" do
      it "token,postal_code,prefecture_id,city,address,phone_numberが空ではない
          postal_codeが半角数字３けた-半角数字４けたで入力されている
          prefecture_idは１が選ばれていない
          phone_numberは半角数字のみで入力されている" do
        expect(@order_address).to be_valid  
      end  
    end  
    context "商品の購入がうまくいかないとき" do
      it "tokenが空" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end  
      it "postal_codeが空" do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code を正しく入力してください")
      end  
      it "postal_codeが半角数字じゃない" do
        @order_address.postal_code = "１２３-１２３"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code を正しく入力してください")
      end  
      it "postal_codeの前半が３文字ではない" do
        @order_address.postal_code = "1234-1234"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code を正しく入力してください")
      end  
      it "postal_codeの後半が４文字じゃない" do
        @order_address.postal_code = "123-123345"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code を正しく入力してください")
      end 
      it "postal_codeの-(ハイフン)がない" do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code を正しく入力してください")
      end  
      it "prefecture_idの１が選ばれる" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end   
      it "phone_numberが半角数字じゃない" do
        @order_address.phone_number = "０９０１２３４５６７８"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is not a number")
      end   
    end  
  end
end
