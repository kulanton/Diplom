class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :discipline_id
      t.integer :group_id
      t.string :year
      t.integer :bloc
    end
  end
end
