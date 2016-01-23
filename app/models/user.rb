class User < ActiveRecord::Base
    has_many :members, dependent: :delete_all
    
    validates :number, uniqueness: true
end