class AdminController < ApplicationController

    before_action :is_admin

    before_action :set_user, only:[:edit, :update, :destroy]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end
    
    def edit
        render 'admin/new'
    end

    def destroy
        @user.destroy
        redirect_to action: "index"
    end

    def update
        @user.attributes = user_params
        @user.save(validate: !user_params[:password].blank?)
        redirect_to action: "index"
    end

    def create
        @user = User.new(user_params)
        @user.save
        redirect_to action: "index"
    end

    def all_files
        @user_files = UserFile.all
        puts params
        render 'user_files/index'
    end

    def clean_cache
        remove_dir("#{Rails.root}/public/#{FileImageUploader.cache_dir}") if File.exist?("#{Rails.root}/public/#{FileImageUploader.cache_dir}")
    end

    private
    def remove_dir(path)
        if File.directory?(path)
          Dir.foreach(path) do |file|
            if ((file.to_s != ".") and (file.to_s != ".."))
              remove_dir("#{path}/#{file}")
            end
          end
          Dir.delete(path)
        else
          File.delete(path)
        end
    end
      

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :middle_name, :birth_date, :email, :password)
    end

    def service_parameters
        %s[utf8 authenticity_token commit controller action]
    end

    def is_admin
        redirect_back(fallback_location: root_path) unless current_user.is_super_user
    end
end
