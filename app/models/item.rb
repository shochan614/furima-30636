class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shopping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  with_options presence: true do
    validates :name
    validates :info
    validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9_999_999 }
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :sales_status_id
      validates :shopping_fee_status_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
  end

  belongs_to :user
  has_one_attached :image
  has_one :purchase
end
