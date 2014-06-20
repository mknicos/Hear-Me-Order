class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      @employee = Employee.find(current_employee)
      @employee.update_attributes(:restaurant_id => @restaurant[:id])
      redirect_to restaurants_path, notice: "Restaurant Added and #{@employee[:first_name]} is a member"
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
