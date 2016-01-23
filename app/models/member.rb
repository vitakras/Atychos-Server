class Member < ActiveRecord::Base
    belongs_to :user
    
    def send_message(message) 
        msg = $twilio.account.messages.create(
            :from => $twilio_number,
            :to => number,
            :body => message
        )
        puts msg.to
    end
end