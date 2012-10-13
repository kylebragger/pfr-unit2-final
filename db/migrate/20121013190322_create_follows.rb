class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :user, null: false
      t.references :follow, null: false

      t.timestamps
    end
    
    add_index :follows, [:user_id, :follow_id], unique: true
  end
end
