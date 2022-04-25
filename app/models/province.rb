class Province < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :orders, dependent: :nullify

  validates :name, :gst, :pst, :hst, presence: true
  validates :gst, :pst, :hst, numericality: true
end
