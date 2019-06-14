class Admin::TalentsController < ApplicationController
  before_action :set_talent, only: [:show, :edit, :update, :destroy]

  # GET /talents
  # GET /talents.json
  def index
    @talents = Talent.all
  end

  # GET /talents/1
  # GET /talents/1.json
  def show

    @instagram_account = InstagramAccount.find_by(talent_id: @talent.id)

    # newからのリダイレクトでは更新は行わない
    return @instagram_account if @instagram_account.is_updated_within?(10)

    # アバターのアップデート
    new_avatar_path = InstagramAccountImageService.new(@instagram_account.account_name).fetch_avatar_path
    @instagram_account.update(image: new_avatar_path) unless @instagram_account.has_same_image_path?(new_avatar_path)

    # 投稿画像のアップデート
    new_image_paths = InstagramContentImageService.new(@instagram_account.account_name).fetch_image_paths
    current_image_paths = @instagram_account.instagram_contents.pluck(:image)
    diff_image_paths = new_image_paths - current_image_paths # 集合の差集合を取得すべき新しい画像として認知
    # 既存の画像のみの場合
    return @instagram_account if diff_image_paths.blank?
    # 新しい画像がある場合
    diff_image_paths.each do |image_path|
      instagram_content = @instagram_account.instagram_contents.new(image: image_path)
      instagram_content.save
    end
    @talent

  end

  # GET /talents/new
  def new
    @talent = Talent.new
  end

  # GET /talents/1/edit
  def edit
  end

  # POST /talents
  # POST /talents.json
  def create

    @talent = current_user.talents.new(name: talent_params[:name])

    # build_has_one でないとだめ!
    @instagram_account = @talent.build_instagram_account(account_name: talent_params[:account_name])

    # アバターの取得
    @instagram_account.image = InstagramAccountImageService.new(@instagram_account.account_name).fetch_avatar_path

    # コンテンツの作成
    image_paths = InstagramContentImageService.new(@instagram_account.account_name).fetch_image_paths
    image_paths.each do |image_path|
      instagram_content = @instagram_account.instagram_contents.new(image: image_path)
    end

    respond_to do |format|
      if @talent.save
        format.html { redirect_to [:admin, @talent], notice: 'Talent was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @talent] }
      else
        format.html { render :new }
        format.json { render json: @talent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /talents/1
  # PATCH/PUT /talents/1.json
  def update
    respond_to do |format|
      if @talent.update(talent_params)
        format.html { redirect_to [:admin, @talent], notice: 'Talent was successfully updated.' }
        format.json { render :show, status: :ok, location: @talent }
      else
        format.html { render :edit }
        format.json { render json: @talent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talents/1
  # DELETE /talents/1.json
  def destroy
    @talent.destroy
    respond_to do |format|
      format.html { redirect_to admin_talents_url, notice: 'Talent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talent
      @talent = Talent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def talent_params
      params.require(:talent).permit(:name, :account_name)
    end

end
