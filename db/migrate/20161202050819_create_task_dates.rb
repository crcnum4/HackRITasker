class CreateTaskDates < ActiveRecord::Migration
  def change
    create_table :task_dates do |t|
      t.integer :task_id
      t.date :due_date
      t.integer :point_value
      t.string :bias
      t.string :description

      t.timestamps null: false
    end
  end
end
