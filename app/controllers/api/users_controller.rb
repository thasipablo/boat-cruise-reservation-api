class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(name: params[:id])

    if @user
      render json: { user: @user }
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: { user: @user }, status: :created
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    name = params[:name]

    @user = User.find_by(name:)

    if @user
      render json: { data: @user }
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def logout
    render json: { message: 'Logout successful' }
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
