class AddProfileFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_fg, :string, default: '000'
    add_column :users, :profile_bg, :string, default: 'fff'
    add_column :users, :profile_image, :string
  end
end
