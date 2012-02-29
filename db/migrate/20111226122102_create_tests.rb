class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.integer :necessary
      t.boolean :block
      t.integer :num_try
      t.integer :period
      t.string :type
      t.integer :auth_type
      t.boolean :w_key
      t.boolean :ext_access
      t.boolean :msiu_access
      t.integer :order
      t.integer :disciplines_groups_id
      t.integer :theme_pct
      t.integer :question_pct

      t.timestamps
    end
  end
end
