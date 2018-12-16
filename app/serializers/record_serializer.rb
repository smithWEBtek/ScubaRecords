class RecordSerializer < ActiveModel::Serializer
  attributes :id, :date, :dive_time, :max_depth, :water_temperature, :notes

  belongs_to :site
  belongs_to :user 
end
