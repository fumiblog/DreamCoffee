class Users::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(user_id: current_user.id)
    @cart_item = CateItem.find(params[:id])
  end

  def create
    # byebug
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.user_id = current_user.id
    @cart_item.save!
    redirect_to users_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to users_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(
      :user_id,
      :item_id,
      :amount)
  end

end
