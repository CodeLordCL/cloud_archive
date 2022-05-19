class AddUserIdToUserFile < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_files, :user, foreign_key: true
  end
end
