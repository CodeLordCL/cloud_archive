class UserFile < ApplicationRecord
    belongs_to :user
    mount_uploader :file_image, FileImageUploader
    def is_video
        self.file_type.include?('video')
    end
    def is_pdf
        self.file_type.include?('pdf')
    end
    def is_image
        self.file_type.include?('image')
    end
end
