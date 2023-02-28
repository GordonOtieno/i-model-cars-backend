class Api::V1::CarsController < ApplicationController
  def index
    @cars = Car.all
    if @cars.empty?
      render json: { message: 'No cars found' }
      response.status = 404
    else
      render json: @cars
    end
  end

  def show
    @car = Car.find(params[:id])
    return unless @car.empty?

    render json: { message: 'No cars found' }
    response.status = 404
    render json: @car
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      render json: { message: 'Car was successfully created' }, status: :created
      response.status = 200
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
    params.require(:car).permit(:name, :car_type, :make, :description, :image, :cost, :speed, :color)
  end
end
