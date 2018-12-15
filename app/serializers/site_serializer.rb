class SiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :location
  has_many :records
  has_many :users, through: :records
end
