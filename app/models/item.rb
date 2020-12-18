class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state

  with_options presence: true, numericality: {other_than: 1} do
    validates :category_id
    validates :state_id
  end  
end
