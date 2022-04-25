class AboutInfo < ApplicationRecord
  validates :description, :email, :twitter, :facebook, :instagram, presence: true
end
