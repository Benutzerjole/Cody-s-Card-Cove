class ZipCodeValidator < ActiveModel::Validator
  def validate(record)
    if not record.zip_code.match(/^[ABCEGHJ-NPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ -]?\d[ABCEGHJ-NPRSTV-Z]\d$/i)
      record.errors.add :base, "Invalid zip code."
    end
  end
end

class Order < ApplicationRecord
  belongs_to :province
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products
  validates_associated :order_products

  validates_with ZipCodeValidator
  validates :address, :province, :city, :zip_code, :gst, :pst, :hst, presence: true
  validates :gst, :pst, :hst, numericality: true
end
