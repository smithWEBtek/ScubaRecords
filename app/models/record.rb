class Record < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :site

  validates :id, uniqueness: true
  validates :date, presence: true
  validates :dive_time, presence: true
  validates :max_depth, presence: true
  validates :water_temperature, presence: true
  validates :activity, presence: true
  validates :notes, presence: true
end
