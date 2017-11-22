class Site < ApplicationRecord
  has_many :records, dependent: :destroy
  has_many :users, through: :records

  # scope :search, ->(site_name) { where("name LIKE ? OR location LIKE ?", "%#{site_name}%", "%#{site_name}%") }
end
