class Admin::InstagramAccountsController < ApplicationController
  # ユーザーのログインを確認
  before_action :authenticate_user!
  before_action :set_instagram_account, only: [:show, :edit, :update, :destroy]

  # GET /instagram_accounts
  # GET /instagram_accounts.json
  def index
    @instagram_accounts = InstagramAccount.all
  end

  # GET /instagram_accounts/1
  # GET /instagram_accounts/1.json
  def show

    # TODO: accountのavatarのアップデート
    #

    # TODO: contentsのアップデート(あとでserviceに任せよう,,,)
    # Notification: cacheなので即時反映のテストはできない、、、
    # 1. accountのlatestなcontent(idがlast)のimageを取得する
    # 2, スクレイピングでimage_pathsを取得
    # 3. 条件分岐

    latest_image_path = @instagram_account.instagram_contents.last.image
    puts "----- test 1 -----"

    # newからのリダイレクトでは更新は行わない
    return @instagram_account if @instagram_account.updated_at > Time.zone.now - 10.second # OK! new の時はwithin 10 secやった

    puts "test 2"

    new_image_paths = InstagramContentImageService.new(@instagram_account.account_name).fetch_image_paths
    current_image_paths = @instagram_account.instagram_contents.pluck(:image)
    diff_image_paths = new_image_paths - current_image_paths

    puts "current_image_paths= #{current_image_paths}"
    puts "new_image_paths = #{new_image_paths}"
    puts "diff_image_paths=#{diff_image_paths}"
    puts "test 3"


    return @instagram_account if diff_image_paths.blank?

    puts "test 4"

    diff_image_paths.each do |image_path|
      instagram_content = @instagram_account.instagram_contents.new(image: image_path)
      instagram_content.save
    end
    puts "----- test 5 -----"
    @instagram_account

  end

  # GET /instagram_accounts/new
  def new
    @instagram_account = InstagramAccount.new
  end

  # GET /instagram_accounts/1/edit
  def edit
  end

  # POST /instagram_accounts
  # POST /instagram_accounts.json
  def create
    @instagram_account = current_user.instagram_accounts.new(instagram_account_params)

    # アバターの取得
    @instagram_account.image = InstagramAccountImageService.new(@instagram_account.account_name).fetch_avatar_path

    # コンテンツの作成
    image_paths = InstagramContentImageService.new(@instagram_account.account_name).fetch_image_paths
    image_paths.each do |image_path|
      instagram_content = @instagram_account.instagram_contents.new(image: image_path)
      instagram_content.save
    end

    respond_to do |format|
      if @instagram_account.save
        format.html { redirect_to [:admin, @instagram_account], notice: 'Instagram account was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @instagram_account] }
      else
        format.html { render :new }
        format.json { render json: @instagram_account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @instagram_account.update(instagram_account_params)
        format.html { redirect_to @instagram_account, notice: 'Instagram account was successfully updated.' }
        format.json { render :show, status: :ok, location: @instagram_account }
      else
        format.html { render :edit }
        format.json { render json: @instagram_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instagram_accounts/1
  # DELETE /instagram_accounts/1.json
  def destroy
    @instagram_account.destroy
    respond_to do |format|
      format.html { redirect_to admin_instagram_accounts_url, notice: 'Instagram account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instagram_account
      @instagram_account = InstagramAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instagram_account_params
      params.require(:instagram_account).permit(:account_name)
    end
end
