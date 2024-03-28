class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :description
      t.integer :duration_hours
      t.integer :duration_days
      t.timestamps
    end
  end
end
