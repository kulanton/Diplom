class CreateScriptsSubThemes < ActiveRecord::Migration
  def change
    create_table :scripts_sub_themes, :id => false do |t|
      t.integer :script_id
      t.integer :sub_theme_id
    end
  end
end
