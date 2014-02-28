class AddCompositeuploadToCheerups < ActiveRecord::Migration
  def change
    add_column :cheerups, :compositeupload, :string
  end
end
