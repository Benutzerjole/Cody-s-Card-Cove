class Product < ApplicationRecord
  paginates_per 16
  
  belongs_to :category
  
  has_one_attached :image
end
