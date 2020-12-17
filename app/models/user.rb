class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # with_options precense: true do
  #   validates :nickname
  #   validates :last_name
  #   validates :first_name
  #   validates :last_name_kana, format: {
  #     with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
  #     message: "全角カタカナのみで入力して下さい"
  #   }
  #   validates :first_name_kana, format: {
  #     with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
  #     message: "全角カタカナのみで入力して下さい"
  #   }
  #   validates :birthday
  # end  

end
