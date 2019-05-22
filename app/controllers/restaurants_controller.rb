class RestaurantsController < ApplicationController
  before_action :find_restuarant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save

    redirect_to restaurants_path
  end

  def edit; end

  def update
    @restaurant.update

    redirect_to restaurants_path
  end

  def destroy
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

  def find_restuarant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
