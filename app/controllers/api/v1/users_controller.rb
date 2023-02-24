class Api::V1::UsersController < ApplicationController
    def create
      @new_user = User.new(
        name: params[:user_name],
        email: params[:user_email],
      )

      if @new_user.save
        render json: "User created successfully!"
        response.status = 200
      else
        render json: "Failed!"
        response.status = 400
      end
    end

    def show
      if User.exists?(params[:id])
        @user = User.find(params[:id])
        @resp = {user_name: @user.name, user_email: @user.email}
        render json: @resp
        response.status = 200
      else
        render json: "User not found!"
        response.status = 404
      end
    end
  end
  