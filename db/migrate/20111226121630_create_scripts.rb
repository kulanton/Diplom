class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.integer :order
      t.string :name
      t.string :redirect_page
      t.integer :time
      t.boolean :blocked
      t.boolean :procents
      t.boolean :passed_themes
      t.boolean :detalized
      t.integer :test_id

      t.timestamps
    end
  end
end
