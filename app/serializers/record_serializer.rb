class RecordSerializer < ActiveModel::Serializer
  attributes :id, :data, :dive_time, :max_depth, :water_temperature, :notes

  belongs_to :site 
end
