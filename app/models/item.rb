class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status

  with_options presence: true do
    validates :name
    validates :info
    validates :price
    validates :category_id, numericality: { other_than: 1 } 
    validates :sales_status_id
    validates :shopping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  belongs_to :user

end
