class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :redeemed, default: false

      t.timestamps null: false
    end
  end
end
