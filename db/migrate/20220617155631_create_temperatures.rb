class CreateTemperatures < ActiveRecord::Migration[7.0]
  def change
    create_table :temperatures do |t|
      t.integer :warm_bottom_temp
      t.integer :warm_top_temp

      t.timestamps
    end
  end
end
