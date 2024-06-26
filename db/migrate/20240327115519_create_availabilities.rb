class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.references :tour, null: false, foreign_key: true
      t.references :availability_rule, null: false, foreign_key: true
      t.datetime :start_time
      t.timestamps
    end
  end
end