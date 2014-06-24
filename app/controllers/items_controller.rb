class ItemsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @restaurant = Restaurant.find(@item.restaurant_id)
    if @item.save
      redirect_to restaurant_path(@restaurant),
        notice: "#{@item.name} added"
    else
      flash[:alert] = "#{@item[:name]} couldn't be added"
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :restaurant_id, :ingredients)
  end

end
