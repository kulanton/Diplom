class CreateBlocksTests < ActiveRecord::Migration
  def change
    create_table :blocks_tests, :id => false do |t|
      t.integer :block_id
      t.integer :test_id
    end
  end
end
