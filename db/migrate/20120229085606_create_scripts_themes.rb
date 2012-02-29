class CreateScriptsThemes < ActiveRecord::Migration
  def change
    create_table :scripts_themes, :id => false do |t|
      t.integer :script_id
      t.integer :theme_id
    end
  end
end
