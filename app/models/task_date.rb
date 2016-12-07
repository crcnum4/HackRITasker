class TaskDate < ActiveRecord::Base
    attr_accessor :add_another
    
    belongs_to :task
end
