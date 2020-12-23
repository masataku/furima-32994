require 'rails_helper'
 
RSpec.describe OrderAddress, type: :model do
  describe "商品購入機能" do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end  
    context "商品の購入がうまくいくとき" do
      it "token,postal_code,prefecture_id,city,address,phone_number,user_id,item_idが空ではない
          postal_codeが半角数字３けた-半角数字４けたで入力されている
          prefecture_idは１が選ばれていない
          phone_numberは半角数字のみで入力されている" do
        expect(@order_address).to be_valid  
      end  
      it "buildingが空でも登録できる" do
        @order_address.building = nil
        @order_address.valid?
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
      it "prefecture_idが空" do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end  
      it "prefecture_idの１が選ばれる" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end 
      it "cityが空" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end 
      it "addressが空" do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end     
      it "phone_numberが半角数字じゃない" do
        @order_address.phone_number = "０９０１２３４５６７８"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is not a number")
      end
      it "phone_numberが11けたより大きい" do
        @order_address.phone_number = "123456789012"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end  
      it "user_idが空" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end 
      it "item_idが空" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end       
    end  
  end
end
