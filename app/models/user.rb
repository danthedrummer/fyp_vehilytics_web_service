class User < ApplicationRecord
    validates_presence_of :name, :email, :password
    validates_presence_of :device_id, :vehicle_manufacturer
end
