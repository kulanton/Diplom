class CreateDisciplineBlockGroups < ActiveRecord::Migration
  def change
    create_table :discipline_block_groups do |t|
      t.integer :discipline_year_block_id
      t.integer :group_id

      t.timestamps
    end
  end
end
