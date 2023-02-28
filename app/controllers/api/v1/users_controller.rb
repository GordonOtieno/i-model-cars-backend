class Api::V1::UsersController < ApplicationController
  def create
    @new_user = User.new(
      name: params[:name],
      email: params[:email]
    )

    if @new_user.save
      render json: 'User created successfully!'
      response.status = 200
    else
      render json: 'Failed!'
      response.status = 400
    end
  end

  def show
    p params
    if User.exists?(name: params[:user_name])
      @user = User.find_by(name: params[:user_name])
      @resp = { name: @user.name, email: @user.email }
      render json: @resp
      response.status = 200
    else
      render json: 'User not found!'
      response.status = 404
    end
  end
end
