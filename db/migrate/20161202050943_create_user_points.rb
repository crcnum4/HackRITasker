class CreateUserPoints < ActiveRecord::Migration
  def change
    create_table :user_points do |t|
      t.integer :user_id
      t.integer :task_id

      t.timestamps null: false
    end
  end
end
