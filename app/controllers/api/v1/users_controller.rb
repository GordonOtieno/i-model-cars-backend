class Api::V1::UsersController < ApplicationController
    def create
      @new_user = User.new(
        name: params[:user_name],
        email: params[:user_email],
      )

      if @new_user.save
        render json: "User created successfully!"
      else
        render json: "Failed!"
      end
    end

    def show
      @user = User.find(params[:id])
      @resp = {user_name: @user.name, user_email: @user.email}
      render json: @resp
    end
  end
  