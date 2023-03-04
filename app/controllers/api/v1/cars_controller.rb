class Api::V1::CarsController < ApplicationController
  def index
    @cars = Car.all
      render json: @cars
  end

  def show
    @car = Car.find_by(id: params[:id])
    if @car.nil?
      render json: { message: 'Car with the Id does not exist' }, status: 404
    else
      render json: @car
    end
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      render json: { message: 'Car was successfully created' }, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    if @car.destroy
      render json: { message: 'Car was successfully deleted' }, status: :no_content
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  private

  def car_params
    params.require(:car).permit(:name, :make, :description, :cost, :speed,:car_type, images:{} ,color:[] )
  end
end
