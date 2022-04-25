class QuantityValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add :base, "Cannot have a negative quantity." if record.quantity <= 0
  end
end

class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, :price, presence: true
  validates :quantity, :price, numericality: true
  validates_with QuantityValidator
end
