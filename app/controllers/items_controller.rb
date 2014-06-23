class ItemsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to restaurant_path(@item.restaurant),
        notice: "#{@item.name} added"
    else
      #render 'restaurants/#{@item.restaurant_id}/items/new'
      #render :new, :locals => {@item => @item, @restaurant => @item.restaurant}
      redirect_to new_restaurant_item_path(@item.restaurant)
      flash[:alert] = "#{@item[:name]} couldn't be added"
    end

  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :restaurant_id)
  end

end
