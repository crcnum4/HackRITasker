class TaskDatesController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy, :create, :new]
    before_action :set_task_date, only: [:show, :edit, :update, :destroy]
    
    def new
        @task_date = TaskDate.new
        @date = Date.today
    end
    
    def show
    end
    
    def edit
    end
    
    def create
        @task_date = TaskDate.new(task_date_params)
        @task_date.task_id = @task.id
        if @task_date.point_value > 0
            @task_date.bias = "Positive"
        elsif @task_date.point_value < 0
            @task_date.bias = "Negative"
        else
            @task_date.bias = "Neutral"
        end
        
        respond_to do |format|
            if @task_date.save
                msg = "Task date successfully created."
                puts params
                if params[:task_date][:add_another] == "Yes"
                    format.html { redirect_to new_task_task_date_path(@task), notice: msg }
                else
                    format.html { redirect_to task_path(@task), notice: msg }
                end
            else
                format.html { render :new }
                format.json { render json: @task_date.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def update
        respond_to do |format|
            if @task_date.update(task_date_params)
                msg = "Task date successfully updated."
                format.html { redirect_to task_path(@task), notice: msg }
            else
                format.html { render :edit }
                format.json { render json: @task_date.errors, status: :unprocessable_entity }
            end
        end
    end
    
    
    private
    def set_task
        @task = Task.find(params[:task_id])
    end
    
    def set_task_date
        @task_date = TaskDate.find(params[:id])
    end
    
    def task_date_params
        params.require(:task_date).permit(:due_date, :point_value, :description, :add_another)
    end
end
