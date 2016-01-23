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
        id = params[:id]
        lon = params[:lon]
        lat = params[:lat]
    
        @user = User.find_by(id: id)
        
        if not @user.nil?
            @members = @user.members
            
            @members.each do |member|
                send_message member.number,  "This is a test msg http://maps.google.com/?ll=#{lat},lon#{lon}"
            end
            render json: "{\"ok\":\"msg sent\"}"
        else
            render json: "{\"error\":\"msg not sent\"}"
        end
    end

    def user_params
      params.require(:user).permit(:number)
    end
    
    def send_message(number, message) 
        puts TWILIO
        msg = TWILIO.account.messages.create(
            :from => TWILIO_NUMBER,
            :to => number,
            :body => message
        )
        puts msg.to
    end
end
