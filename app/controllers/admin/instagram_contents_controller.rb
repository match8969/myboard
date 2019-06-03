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
    # works
    # instagram_content = InstagramContent.new(instagram_account_id: params[:instagram_account_id])
    # # assetsに格納のため、ファイル名のみを抽出
    # instagram_content.images = File.basename(instagram_content.fetch_images)
    # instagram_content.save
    # redirect_back(fallback_location: root_path)

    # test
    # instagram_content = InstagramContent.new(instagram_account_id: params[:instagram_account_id])


    # require 'aws-sdk'

    # AWS 公式
    # s3 = Aws::S3::Resource.new(region: "#{ENV['S3_REGION']}")
    # my_bucket = s3.bucket("#{ENV['S3_BUCKET']}")
    # my_bucket.create
    # name = File.basename 'my_file'
    # obj = s3.bucket('my-bucket').object(name)
    # obj.upload_file('my_file')

    # インスタンスの生成
    instagram_content = InstagramContent.new(instagram_account_id: params[:instagram_account_id])
    paths = instagram_content.fetch_images

    if Rails.env.production?
      access_key_id = "#{ENV['S3_ACCESS_KEY']}"
      secret_access_key = "#{ENV['S3_SECRET_KEY']}"
      region = "#{ENV['S3_REGION']}"
      bucket = "#{ENV['S3_BUCKET']}" # S3バケット名

      instagram_content.images = paths

      key = "#{File.basename(paths)}" #S3のファイル名
      client = Aws::S3::Client.new(
          access_key_id: access_key_id,
          secret_access_key: secret_access_key,
          region: region
      )
      upload_file = paths
      client.put_object(bucket: bucket, key: key, body: File.open(upload_file))
    end

    instagram_content.images = paths
    instagram_content.save
    redirect_back(fallback_location: root_path)
    #
    #
    # instagram_content.images = File.basename(instagram_content.fetch_images)
    # instagram_content.save
    # redirect_back(fallback_location: root_path)



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
