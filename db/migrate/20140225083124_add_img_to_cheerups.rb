class AddImgToCheerups < ActiveRecord::Migration
  def change
    add_column :cheerups, :image, :string
  end
end
