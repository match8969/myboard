class Admin::InstagramContentsController < ApplicationController
  # ユーザーのログインを確認
  before_action :authenticate_user!
  before_action :set_instagram_content, only: [:show, :edit, :update, :destroy]

  # GET /instagram_contents
  # GET /instagram_contents.json
  def index
    @instagram_contents = InstagramContent.all
  end

  # GET /instagram_contents/1
  # GET /instagram_contents/1.json
  def show
  end

  # GET /instagram_contents/new
  def new
    @instagram_content = InstagramContent.new
  end

  # GET /instagram_contents/1/edit
  def edit
  end

  def create
    instagram_account = InstagramAccount.find(params[:instagram_account_id])
    image_paths = InstagramContentImageService.new(instagram_account.account_name).fetch_image_paths
    image_paths.each do |image_path|
      instagram_content = instagram_account.instagram_contents.new(image: image_path)
      instagram_content.save
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instagram_content
      @instagram_content = InstagramContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instagram_content_params
      params.require(:instagram_content).permit(:instagram_account_id)
    end
end
