class Site < ApplicationRecord
  has_many :records, dependent: :destroy
  has_many :users, through: :records

  validates :name, presence: true
  validates :name, uniqueness: true 
  validates :location, presence: true

  # scope :search, ->(site_name) { where("name LIKE ? OR location LIKE ?", "%#{site_name}%", "%#{site_name}%") }
end
