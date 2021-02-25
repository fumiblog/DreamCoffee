class Users::CartItemsController < ApplicationController
  def index
    @cart_items = current_user.cart_items
  end

  def create
    # byebug
    @cart = current_cart
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.user_id = current_user.id
    # byebug
    @cart_item.save
    redirect_to users_cart_items_path
  end

  def update
    @cart_items = current_user.cart_items
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to users_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to users_cart_items_path
  end

  def destroy_all
    @cart_items = current_user.cart_items
    @cart_items.destroy_all
    redirect_to users_cart_items_path
  end

  def set_cart
    @cart = current_cart
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(
      :user_id,
      :item_id,
      :amount)
  end

end
