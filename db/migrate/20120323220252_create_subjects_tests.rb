class CreateSubjectsTests < ActiveRecord::Migration
  def change
    create_table :subjects_tests, :id => false do |t|
      t.integer :subject_id
      t.integer :test_id
    end
  end
end
