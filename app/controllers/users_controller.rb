class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    
   
    #GET /users?:email&:password
    def index 
        @users = User.all
        json_response(@users)
    end
    
    # I know this is a bad idea but it's just for a demo, 
    # will be done properly in next iteration
    def show
        @user = User.find(params[:email])
        if @user.password === params[:password]
            json_response(@user)
        else
            render(:status => 403)
        end
    end
    
    #POST /users
    def create
        @user = User.create!(register_params)
        json_response(@user, :created)
    end
    
    #DELETE /users?:email
    def destroy
        @user = User.find(params[:email])
        if @user.password == params[:password]
            @user.destroy
        end
        head :no_content
    end
    
    private
    
    def set_user
        @user = User.find(params[:email])
    end
    
    def register_params
        params.permit(:name, :email, :password, :device_id, :vehicle_manufacturer)
    end
    
    def delete_params
        params.permit(:email, :password)
    end
    
end
