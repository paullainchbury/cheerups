class CreateCheerups < ActiveRecord::Migration
  def change
    create_table :cheerups do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
