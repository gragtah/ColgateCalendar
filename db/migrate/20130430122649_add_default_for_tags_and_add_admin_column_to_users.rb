class AddDefaultForTagsAndAddAdminColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :null => false, :default => false
    change_column :users, :tags, :string, :null => false, :default => ""
  end
end
