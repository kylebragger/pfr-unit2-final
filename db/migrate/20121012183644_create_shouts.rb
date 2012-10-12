class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.references :user
      
      t.text :content, null: false

      t.timestamps
    end
    
    add_index :shouts, :user_id
  end
end
