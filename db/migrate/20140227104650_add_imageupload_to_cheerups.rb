class AddImageuploadToCheerups < ActiveRecord::Migration
  def change
    add_column :cheerups, :imageupload, :string
  end
end
