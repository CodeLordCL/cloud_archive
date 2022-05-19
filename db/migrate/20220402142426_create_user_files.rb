class CreateUserFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_files do |t|
      t.string :file_name
      t.string :file_type
      t.integer :file_size

      t.timestamps
    end
  end
end
