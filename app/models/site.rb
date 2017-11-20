class Site < ApplicationRecord
  has_many :records, dependent: :destroy
  has_many :users, through: :records

  accepts_nested_attributes_for :records 

end
