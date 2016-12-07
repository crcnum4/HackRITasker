class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :title
      t.text :description
      t.integer :points_required

      t.timestamps null: false
    end
  end
end
