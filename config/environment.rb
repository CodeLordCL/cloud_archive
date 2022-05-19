# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#CarrierWave.configure do |config|
#    config.ftp_host = "localhost"
#    config.ftp_port = 21
#    config.ftp_user = "cloud_archive"
#    config.ftp_passwd = "123456"
#    config.ftp_folder = "/home/cloud_archive"
#    config.ftp_url = "http://localhost:21/home/cloud_archive/uploads"
#    config.ftp_passive = false # false by default
#    config.ftp_tls = false # false by default
#    config.cache_storage = :file
#  end
#CarrierWave.configure do |config|
#  config.ftp_host = "ftp"
#  config.ftp_port = 21
#  config.ftp_user = "admin"
#  config.ftp_passwd = "123456"
#  config.ftp_passive = false # false by default
#  config.ftp_tls = false # false by default
#  config.cache_storage = :file
#  config.cache_dir = 'uploads'
#end

CarrierWave.configure do |config|
  config.ftp_host = "ftp"
  config.ftp_port = 21
  config.ftp_user = "admin"
  config.ftp_passwd = "123456"
  config.ftp_url = 'http://127.0.0.1:3000'
  config.ftp_passive = false # false by default
  config.ftp_tls = false # false by default
  config.cache_storage = :file
  config.cache_dir = 'uploads'
end
