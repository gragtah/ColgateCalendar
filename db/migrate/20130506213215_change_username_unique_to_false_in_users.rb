class ChangeUsernameUniqueToFalseInUsers < ActiveRecord::Migration
  def change
    remove_index(:users, :name => 'index_users_on_username')
  end
end
