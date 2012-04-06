class CreateExamines < ActiveRecord::Migration
  def change
    create_table :examines do |t|
      t.string :name
      t.boolean :necessary
      t.boolean :block
      t.integer :num_try
      t.integer :period
      t.integer :test_type
      t.integer :auth_type
      t.boolean :w_key
      t.boolean :ext_access
      t.boolean :msiu_access
      t.integer :order
      t.date :scheduled_date
      t.integer :scheduled_pair

      t.timestamps
    end
  end
end
