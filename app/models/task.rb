class Task < ActiveRecord::Base
    has_many :task_dates
    has_one :user, through: :user_point
    
end
