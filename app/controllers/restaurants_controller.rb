class RestaurantsController < ApplicationController
  def join
  end

  def select
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path, notice: "Restaurant Added"
    else
      flash[:alert] = "#{@restaurant[:name]} couldn't be added"
      render :new
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def index
    @restaurants = Restaurant.all
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:phone, :name, :address)
  end
end
