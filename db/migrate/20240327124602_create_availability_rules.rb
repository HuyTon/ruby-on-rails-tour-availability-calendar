class CreateAvailabilityRules < ActiveRecord::Migration[6.0]
  def change
    create_table :availability_rules do |t|
      t.string :rule_type
      t.json :rule_data
      t.timestamps
    end
  end
end
