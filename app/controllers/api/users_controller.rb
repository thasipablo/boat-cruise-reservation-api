class Api::UsersController < ApplicationController
    def show
      @user = User.find_by(name: params[:name])
  
      if @user
        render json: { user: @user }
      else
        render json: { error: 'User not found' }, status: :not_found
      end
    end
  end
  