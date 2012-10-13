class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :shouts_tags, primary_key: false do |t|
      t.references :tag
      t.references :shout
    end
    
    add_index :shouts_tags, [:shout_id, :tag_id]
  end
end
