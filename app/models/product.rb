class SalePriceIsNumberValidator < ActiveModel::Validator
  def validate(record)
    if record.sale_price and record.sale_price.is_a?(Numeric)
      record.errors.add :base, "Sale price must be a number if it exists."
    end
  end
end

class ProductQuantityValidator < ActiveModel::Validator
  def validate(record)
    if record.quantity_in_stock < 0
      record.errors.add :base, "#{record.name} has insufficient quantity for this order."
    end
  end
end

class Product < ApplicationRecord
  paginates_per 16
  
  belongs_to :category
  has_many :order_products
  has_many :orders, through: :order_products
  
  has_one_attached :image

  validates_with ProductQuantityValidator
  validates_with SalePriceIsNumberValidator
  validates :name, :base_price, :quantity_in_stock, presence: true
  validates :quantity_in_stock, :base_price, numericality: true
end