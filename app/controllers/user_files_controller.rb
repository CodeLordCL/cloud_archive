class UserFilesController < ApplicationController
  before_action :set_user_file, only: [:show, :edit, :update, :destroy]
  before_action :cache_user_file, only: [:show]
  before_action :clean_cache_user_file, only: [:index]
  # GET /user_files or /user_files.json
  def index
    @user_files = current_user.user_files
  end

  # GET /user_files/1 or /user_files/1.json
  def show
  end

  # GET /user_files/new
  def new
    @user_file = UserFile.new
  end

  # GET /user_files/1/edit
  def edit
  end

  # POST /user_files or /user_files.json
  def create
    return unless params[:user_file][:file_image]
    
    @user_file = UserFile.new(user_file_params)

    respond_to do |format|
      if @user_file.save
        format.html { redirect_to user_file_url(@user_file), notice: "User file was successfully created." }
        format.json { render :show, status: :created, location: @user_file }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_files/1 or /user_files/1.json
  def update
    return unless params[:user_file][:file_image]

    respond_to do |format|
      if @user_file.update(user_file_params)
        format.html { redirect_to user_file_url(@user_file), notice: "User file was successfully updated." }
        format.json { render :show, status: :ok, location: @user_file }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_files/1 or /user_files/1.json
  def destroy
    @user_file.destroy

    respond_to do |format|
      format.html { redirect_to user_files_url, notice: "User file was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_file
      @user_file = UserFile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_file_params
      {
        user_id: params[:user_file][:user_id],
        file_image: params[:user_file][:file_image],
        file_name: params[:user_file][:file_image].original_filename,
        file_type: params[:user_file][:file_image].content_type,
        file_size: params[:user_file][:file_image].size
      }
    end

    def cache_user_file
      @user_file.file_image.cache!
    end

    def clean_cache_user_file
      File.delete(@user_file.file_image.cache_path) if @user_file
    end

end
