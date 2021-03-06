class ProductQuantityValidator < ActiveModel::Validator
  def validate(record)
    return unless record.quantity_in_stock.negative?

    record.errors.add :base, "#{record.name} has insufficient quantity for this order."
  end
end

class Product < ApplicationRecord
  paginates_per 16

  belongs_to :category
  has_many :order_products, dependent: :nullify
  has_many :orders, through: :order_products

  has_one_attached :image

  validates_with ProductQuantityValidator
  validates :name, :base_price, :quantity_in_stock, presence: true
  validates :quantity_in_stock, :base_price, numericality: true
end
