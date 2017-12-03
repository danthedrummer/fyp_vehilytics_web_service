class ReadingsController < ApplicationController
    before_action :set_reading_by_id, only: [:show, :update, :destroy]
    before_action :set_readings_by_device_id, only: [:show]
    
    #GET readings for a device
    def index
        @readings = Reading.where(device_id: params[:device_id])
        json_response(@readings)
    end
    
    def show
        set_reading_by_id
        json_response(@reading)
    end
    
    def create
        @reading = Reading.create!(reading_params)
        json_response(@reading, :created)
    end
    
    def destroy
        @reading.destroy
        head :no_content
    end
    
    private 
    
    def set_reading_by_id
        @reading = Reading.find(params[:id])
    end
    
    def set_readings_by_device_id
        @readings = Reading.where(params[:device_id])
    end
    
    def reading_params
        params.permit(:sensor_name, :range_min, :range_max, :unit, :value, :device_id)
    end
end
