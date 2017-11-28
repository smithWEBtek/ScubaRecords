class Site < ApplicationRecord
  has_many :records, dependent: :destroy
  has_many :users, through: :records

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :location, presence: true

  # accepts_nested_attributes_for :records, :reject_if => :all_blank

  def records_attributes=(records_attributes)
    records_attributes.values.each do |record_attribute|
      self.records.build(record_attribute)
    end
  end

  # scope :search, ->(site_name) { where("name LIKE ? OR location LIKE ?", "%#{site_name}%", "%#{site_name}%") }
end
