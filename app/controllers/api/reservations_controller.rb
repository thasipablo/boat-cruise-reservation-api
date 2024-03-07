class Api::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    render json: @reservations, status: :ok
  end

  def show
    user = User.find_by(name: params[:id])

    if user
      @reservations = user.reservations
      render json: @reservations, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
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
