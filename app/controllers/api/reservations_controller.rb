class Api::ReservationsController < ApplicationController

  def index
    #coming soon
  end

  def show
    #coming soon
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:date, :city, :boat_id, :user_id)
  end
end
