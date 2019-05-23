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
    @instagram_account = InstagramAccount.new(instagram_account_params)

    respond_to do |format|
      if @instagram_account.save
        format.html { redirect_to @instagram_account, notice: 'Instagram account was successfully created.' }
        format.json { render :show, status: :created, location: @instagram_account }
      else
        format.html { render :new }
        format.json { render json: @instagram_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instagram_accounts/1
  # PATCH/PUT /instagram_accounts/1.json
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
      params.fetch(:instagram_account, {})
    end
end