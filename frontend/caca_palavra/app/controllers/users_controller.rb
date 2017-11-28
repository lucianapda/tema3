# encoding: utf-8
class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    users = User.select(:id, :name, :email, :type).all
  end

  def create
    user = User.new(params[:user].permit!)
    if user.save
      render json: user.id
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def show
    @user = User.select(:id, :name, :email, :type).includes(:grades).find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(params[:user].permit(:name))
      render json: user.id
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end
end
