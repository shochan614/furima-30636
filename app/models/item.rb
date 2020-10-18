class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :info
    validates :price
    validates :category_id
    validates :sales_status_id
    validates :shopping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  belongs_to :user
end
