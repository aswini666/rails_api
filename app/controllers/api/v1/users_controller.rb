class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: [:show, :destroy, :edit, :update]
  include UserHelper

  def index
    @users = User.all
    apply_sorting
    render json: {users: @users}, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {user: @user}, status: :created
    else
      render json: {errors: @user.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @user.update_attributes(user_params.except(:email))
      render json: {user: @user}, status: :accepted
    else
      render json: {errors: @user.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: {message: "user destroyed successfully"}, status: :Successfully_Destroyed
    else
      render json: {message: "Unable to destroy user"}, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :city)
  end

  def set_params
    @user = User.find(params[:id])
  end
end
