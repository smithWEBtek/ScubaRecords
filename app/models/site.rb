class Site < ApplicationRecord
  has_many :records, dependent: :destroy
  has_many :users, through: :records

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :location, presence: true

  #accepts_nested_attributes_for :records

  def records_attributes=(records_attributes)
    records_attributes.values.each do |record_attribute|
      if record_attribute[:id]
        record = Record.find(record_attribute[:id])
        record.update(record_attribute)
      else
        self.records.build(record_attribute)
      end
    end
  end

  # def records_attributes=(records_attributes)
  #   records_attributes.values.each do |record_attribute|
  #     self.records.find_or_create_by(record_attribute)
  #   end
  # end


  # scope :search, ->(site_name) { where("name LIKE ? OR location LIKE ?", "%#{site_name}%", "%#{site_name}%") }
end
