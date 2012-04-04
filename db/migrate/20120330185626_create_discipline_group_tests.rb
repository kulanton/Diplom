class CreateDisciplineGroupTests < ActiveRecord::Migration
  def change
    create_table :discipline_group_tests, :id => false do |t|
      t.integer :test_id
      t.integer :discipline_year_block_id
    end
  end
end
