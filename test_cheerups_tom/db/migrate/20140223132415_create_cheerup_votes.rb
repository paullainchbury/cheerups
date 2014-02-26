class CreateCheerupVotes < ActiveRecord::Migration
  def change
    create_table :cheerup_votes do |t|
      t.integer :cheerup_id
      t.integer :user_id
      t.integer :value

      t.timestamps
    end
  end
end
