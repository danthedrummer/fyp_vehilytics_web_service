class Reading < ApplicationRecord
    validates_presence_of :sensor_name, :range_min, :range_max 
    validates_presence_of :unit, :value, :device_id
end
