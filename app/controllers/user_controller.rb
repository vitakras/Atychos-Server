class UserController < ApplicationController
    
    #GET Returns a list of all users in the db 
    def index
        @users = User.all
        render json: @users
    end
    
    #POST Gets or Creates a new user if one does not exist
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
    
    #POST gets members for a user
    def get_members
        @user = User.find_by(user_params)
        @members = @user.members
        
        if not @members.nil?
            render json: @members
        else 
            render json: ""
        end
    end
    
    #POST sends an alert to the members for a user
    def send_alert
        @user = User.find_by(user_params)
        @members = @user.members
        
        @members.each do |member|
            member.send_message "This is a test msg"
        end
        
        render json: ""
    end

    def user_params
      params.require(:user).permit(:number)
    end
end
