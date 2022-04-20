class Order < ApplicationRecord
  belongs_to :province
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products
end
