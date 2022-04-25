class QuantityValidator < ActiveModel::Validator
  def validate(record)
    if record.quantity <= 0
      record.errors.add :base, "Cannot have a negative quantity."
    end
  end
end

class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, :price, presence: true
  validates :quantity, :price, numericality: true
  validates_with QuantityValidator
end
