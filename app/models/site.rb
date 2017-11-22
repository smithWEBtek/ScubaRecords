class Site < ApplicationRecord
  has_many :records, dependent: :destroy
  has_many :users, through: :records
end
