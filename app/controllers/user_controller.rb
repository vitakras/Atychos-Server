class UserController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end
    
    def get
        new_user = User.new(user_params)
        @user = User.find_by(number: new_user.number)
        
        if not @user.nil?
            render json: @user
        else 
            new_user.save
            render json: new_user
        end
    end

    def user_params
      params.require(:user).permit(:number)
    end
end
