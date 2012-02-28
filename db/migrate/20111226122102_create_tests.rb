class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.integer :necessary
      t.integer :block
      t.integer :num_try
      t.integer :period
      t.string :type
      t.integer :auth_type
      t.integer :w_key
      t.integer :ext_access
      t.integer :msiu_access
      t.integer :oder
      t.integer :disciplines_groups_id
      t.integer :theme_pct
      t.integer :question_pct

      t.timestamps
    end
  end
end
