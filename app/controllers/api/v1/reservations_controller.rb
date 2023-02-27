class Api::V1::ReservationsController < ApplicationController
    def index
    end
    def create
      @new_reservation = Reservation.new
    end
    def show
    end
    def destroy
    end
    
  end
  