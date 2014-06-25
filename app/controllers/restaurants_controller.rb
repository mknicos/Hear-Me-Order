class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      @employee = Employee.find(current_employee)
      @employee.update_attributes(:restaurant_id => @restaurant[:id])
      redirect_to restaurants_path, notice: "#{@restaurant[:name]} Added and #{@employee[:first_name]} is a member"
    else
      flash[:alert] = "#{@restaurant[:name]} couldn't be added"
      render :new
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def index
    if current_user
      @restaurants = Restaurant.all
      render :index
    elsif current_employee
      @restaurant = Restaurant.find(current_employee.restaurant)
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to root_path, alert: "You must sign in to view that page"
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:phone, :name, :address)
  end
end
