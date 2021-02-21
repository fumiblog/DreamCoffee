class Users::ItemsController < ApplicationController
  def index
    @roasts = Roast.all
    @tastes = Taste.all
    # byebug
    if params[:roast_id] === nil && params[:taste_id] === nil
      @items = Item.all
    elsif params[:taste_id] === nil
      @items = Item.where(roast_id: params[:roast_id])
    elsif params[:roast_id] === nil
      @items = Item.where(taste_id: params[:taste_id])
    end
    # byebug
  end

end
