class AddIsSuperUserToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_super_user, :boolean, default: false
  end
end
