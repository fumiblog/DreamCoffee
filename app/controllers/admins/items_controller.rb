class Admins::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
    @genres = Genre.all
    @roasts = Roast.all
    @tastes = Taste.all
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to admins_items_path
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
    @roasts = Roast.all
    @tastes = Taste.all
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admins_items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admins_items_path
  end

  private

  def item_params
    params.require(:item).permit(
      :genre_id,
      :name,
      :image,
      :intoroduction,
      :price,
      :is_active,
      :roast_id,
      :taste_id
    )
  end

end
