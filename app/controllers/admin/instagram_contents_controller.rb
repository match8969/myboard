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
    instagram_content = InstagramContent.new(instagram_account_id: params[:instagram_account_id])
    # assetsに格納のため、ファイル名のみを抽出
    instagram_content.images = File.basename(instagram_content.fetch_images)
    instagram_content.save
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
