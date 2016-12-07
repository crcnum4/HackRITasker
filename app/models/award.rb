class Award < ActiveRecord::Base
    has_many :users, through: :user_point
end
