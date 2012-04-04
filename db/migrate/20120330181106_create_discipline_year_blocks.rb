class CreateDisciplineYearBlocks < ActiveRecord::Migration
  def change
    create_table :discipline_year_blocks do |t|
      t.integer :discipline_id
      t.string :year
      t.integer :block_number

      t.timestamps
    end
  end
end
