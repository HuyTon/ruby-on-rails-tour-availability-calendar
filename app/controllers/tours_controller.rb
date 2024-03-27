class ToursController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_tour, only: [:show, :update, :destroy]

  def index
    @tours = Tour.all
    render json: @tours
  end

  def show
    render json: @tour
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      render json: @tour, status: :created
    else
      render json: @tour.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tour.update(tour_params)
      render json: @tour
    else
      render json: @tour.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tour.destroy
    head :no_content
  end

  private

  def set_tour
    @tour = Tour.find(params[:id])
  end

  def tour_params
    params.require(:tour).permit(:name, :description, :duration_hours, :duration_days)
  end
end