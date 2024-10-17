class Api::BoatsController < ApplicationController
  before_action :set_boat, only: %i[show destroy]

  def index
    @boats = Boat.all
    render json: @boats, status: :ok
  end

  def show
    render json: @boat
  end

  def create
    @boat = Boat.new(boat_params)
    if @boat.save
      render json: @boat, status: :created
    else
      render json: @boat.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @boat.destroy
      render json: { message: 'Boat was successfully destroyed' }, status: :ok
    else
      render json: { errors: @boat.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:name, :description, :image, :availability, :duration, :finance, :option, :amount)
  end
end
