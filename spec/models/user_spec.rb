require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー管理機能' do
    
    describe 'ユーザーの新規登録機能' do
      before do
        @user = FactoryBot.build(:user)
      end  
      context '新規登録がうまくいくとき' do  
        it "全てのフォームが空ではない
            emailに@が含まれている
            passwordは6字以上であり半角英数字でどちらも含まれる
            passwordとpassword_confirmationが一致
            パスワードとパスワード（確認用）、値が一致している
            first_nameとlast_nameが全角である
            first_name_kanaとlast_name_kanaがカタカナの全角である" do
          expect(@user).to be_valid
        end 
      end 
      
      context '新規登録がうまくいかないとき' do
        it "ニックネームが空" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end 
        it "メールアドレスが空" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end 
        it "メールアドレスが重複" do
          another_user = FactoryBot.create(:user)
          @user.email = another_user.email
          @user.valid?
          expect(@user.errors.full_messages).to include("Email has already been taken")
        end  
        it "メールアドレスに@がない" do
          @user.email = "abc123"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end  
        it "パスワードが空" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end 
        it "パスワード(確認)がパスワードと異なる" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "パスワードが5文字以下" do
          @user.password = "1234a"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end  
        it "パスワードが全角入力される" do
          @user.password = "000aaA"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password 半角英数字のみで入力して下さい")
        end  
        it "パスワードが英字のみ" do
          @user.password = "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password 半角英数字のみで入力して下さい")
        end  
        it "パスワードが数字のみ" do
          @user.password = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password 半角英数字のみで入力して下さい")
        end  
        it "生年月日が空" do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end    
        it "苗字が空" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it "苗字が全角漢字・ひらがな・カタカナ以外が入力されている" do
          @user.last_name = "aAdf"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
        end
        it "名前が空" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end 
        it "名前が全角漢字・ひらがな・カタカナ以外が入力されている" do
          @user.first_name = "aAdf"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
        end
        it "苗字(カナ)が空" do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end  
        it "名前(カナ)が空" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end    
        it "苗字(カナ)が全角のカタカナではない" do
          @user.last_name_kana = "あいう"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana 全角カタカナのみで入力して下さい")
        end 
        it "名前(カナ)が全角のカタカナではない" do
          @user.first_name_kana = "あいう"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana 全角カタカナのみで入力して下さい")
        end   
      end  
    end

  end  
end
