class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.integer :order
      t.string :name
      t.string :redirect_page
      t.integer :time
      t.integer :blocked
      t.integer :test_id
      t.boolean :procents
      t.boolean :passed_themes
      t.boolean :detalized

      t.timestamps
    end
  end
end
