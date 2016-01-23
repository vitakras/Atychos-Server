class User < ActiveRecord::Base
    has_many :members
    
    validates :number, uniqueness: true
end