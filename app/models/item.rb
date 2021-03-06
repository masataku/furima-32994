class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date
  has_one_attached :image
  belongs_to :user
  has_one :order
  has_many :comments
  has_many :likes

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, numericality: {greater_than: 299, less_than: 10000000, only_integer: true}
    with_options numericality: {other_than: 1} do
      validates :category_id
      validates :state_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :shipping_date_id
    end  
  end  
end
