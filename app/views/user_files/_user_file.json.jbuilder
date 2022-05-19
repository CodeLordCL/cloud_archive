json.extract! user_file, :id, :file_name, :file_type, :file_size, :created_at, :updated_at
json.url user_file_url(user_file, format: :json)
