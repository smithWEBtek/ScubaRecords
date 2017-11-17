class Site < ApplicationRecord
  has_many :records
  has_many :users, through: :records, dependent: :destroy

end
