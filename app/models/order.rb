class ZipCodeValidator < ActiveModel::Validator
  def validate(record)
    if record.zip_code.match(/^[ABCEGHJ-NPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ -]?\d[ABCEGHJ-NPRSTV-Z]\d$/i)
      return
    end

    record.errors.add :base, "Invalid zip code."
  end
end

class Order < ApplicationRecord
  belongs_to :province
  belongs_to :user
  has_many :order_products, dependent: :nullify
  has_many :products, through: :order_products
  validates_associated :order_products

  validates_with ZipCodeValidator
  validates :address, :province, :city, :zip_code, :gst, :pst, :hst, presence: true
  validates :gst, :pst, :hst, numericality: true
end
