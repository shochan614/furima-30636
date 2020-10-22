class Address < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


  with_optinos precense: true do
    validates :postal_code, format: { ^[0-9]{3}-[0-9]{4}$ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number
    validates 
  end
end
