class Address < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # 0[89]0\d{8}
  # ^0\d{9,10}$



  
end
