class Api::BoatsController < ApplicationController
  before_action :set_boat, only: [:show]

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

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:name, :description, :image, :availability, :duration, :finance, :option, :amount)
  end
end
