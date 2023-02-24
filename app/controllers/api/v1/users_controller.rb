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
      render json: "Checking user"
    end
  end
  