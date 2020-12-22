class OrderAdress
  include ActiveModel::Model

  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :postal_code
    validates :prefecture_id, numericality: {other_than: 1}
    validates :city
    validates :address
    validates :phone_number
  end  

  def save 
    order = Order.create(user_id: current_user.id, item_id: params[:item_id])
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, order_id: order.id)
  end  
end  