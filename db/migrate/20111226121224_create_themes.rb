class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.integer :discipline_id
      t.integer :script_id

      t.timestamps
    end
  end
end
