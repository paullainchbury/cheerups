class RemoveCharactersFromCheerups < ActiveRecord::Migration
  def up
    remove_column :cheerups, :characters
    add_column :cheerups, :title, :string
    add_column :cheerups, :sub_title, :string
  end

  def down
    remove_column :cheerups, :title
    remove_column :cheerups, :sub_title
    add_column :cheerups, :characters, :text
  end
end

