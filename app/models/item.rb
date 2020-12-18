class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_fee
  belongs_to :prefecture

  with_options presence: true, numericality: {other_than: 1} do
    validates :category_id
    validates :state_id
    validates :shipping_fee_id
    validates :prefecture_id
  end  
end
