class AddFileImageToUserFile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_files, :file_image, :string
  end
end
