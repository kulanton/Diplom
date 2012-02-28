class CreateDisciplinesGroups < ActiveRecord::Migration
  def change
    create_table :disciplines_groups do |t|
      t.integer :discipline_id
      t.integer :group_id

      t.timestamps
    end
  end
end
