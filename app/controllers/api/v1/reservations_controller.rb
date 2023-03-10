class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: params[:user_id])

    if @reservations.empty?
      render json: 'Nothing Found!', status: :not_found
    else
      render json: @reservations, status: :ok
    end
  end

  def create
    @new_reservation = Reservation.new(
      date: params[:date],
      city: params[:city],
      user_id: params[:user_id],
      car_id: params[:car_id]
    )

    if @new_reservation.save
      render json: 'Resevation Created!', status: :ok
    else
      render json: 'Failed!', status: :unprocessable_entity
    end
  end
end
