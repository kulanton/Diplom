class CreateSubThemes < ActiveRecord::Migration
  def change
    create_table :sub_themes do |t|
      t.string :name
      t.integer :start_num
      t.integer :end_num
      t.integer :theme_id
      t.integer :questions
      t.integer :answers

      t.timestamps
    end
  end
end
