class UserZipCodeValidator < ActiveModel::Validator
  def validate(record)
    if record.zip_code && !record.zip_code.match(/^[ABCEGHJ-NPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ -]?\d[ABCEGHJ-NPRSTV-Z]\d$/i)
      record.errors.add :base, "Invalid zip code."
    end
  end
end

class UserPhoneNumberValidator < ActiveModel::Validator
  def validate(record)
    if record.phone_number && !record.phone_number.match(/^(\+0?1\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$/i)
      record.errors.add :base, "Invalid phone number."
    end
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :province
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_with UserZipCodeValidator
  validates_with UserPhoneNumberValidator
end
