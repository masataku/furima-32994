class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: { 
      with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, 
      message: '全角文字を使用してください' } do
      validates :last_name
      validates :first_name
    end  
    with_options format: {
      with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
      message: "全角カタカナのみで入力して下さい"} do
      validates :last_name_kana
      validates :first_name_kana
    end  
    
  end
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/, message: "半角英数字のみで入力して下さい"}  

end
