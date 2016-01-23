class HomeController < ApplicationController
    def index
        @temp = "hello"
        
        
        #message = $twilio.account.messages.create(
         #   :from => $twilio_number,
          #  :to => "2892642360",
           # :body => "hello there",
            # US phone numbers can make use of an image as well.
            # :media_url => image_url 
        #)
      #puts message.to
    end
end
