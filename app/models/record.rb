class Record < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :site

  validates :id, uniqueness: true
  validates :date, presence: true
  validates :dive_time, presence: true
  validates :max_depth, presence: true
  validates :water_temperature, presence: true
  validates :notes, presence: true

  def self.extreme_dives
    @extreme_dives = self.all.select do |extreme_dive|
      extreme_dive.max_depth >= 120
    end
  end

end
