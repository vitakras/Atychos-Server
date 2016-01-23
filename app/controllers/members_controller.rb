class MembersController < ApplicationController

    def index
        @members = Member.all;
        render json: @members
    end
    
    def add
        new_member = Member.create(member_params)
        render json: new_member
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:number, :user_id)
    end
end