class Product < ApplicationRecord
  paginates_per 16
  
  belongs_to :category
  has_many :order_products
  has_many :orders, through: :order_products
  
  has_one_attached :image
end
