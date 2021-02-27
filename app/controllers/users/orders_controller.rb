class Users::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_user.addresses
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.save
    redirect_to users_confirm_path
  end

  def confirm
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
    @cart_items = current_user.cart_items
    @sum = 0
    @cart_items.each do |cartitem|
      @sum += cartitem.amount * cartitem.item.price
    end
    if @sum < 3000
      @order.shipping_cost = 800
    elsif @sum < 5000
      @order.shipping_cost = 400
    else
      @order.shipping_cost = 0
    end
    # byebug
    if params[:flag] == '0'
      @order.name = current_user.name
      @order.postal_code = current_user.postal_code
      @order.address = current_user.address
      @order.telephone = current_user.telephone
    elsif params[:flag] == '1'
      @address = Address.find(params[:address_id])
      @order.name = @address.name
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.telephone = @address.telephone
    else
    end
    # byebug

  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(
      :user_id,
      :postal_code,
      :address,
      :name,
      :telephone,
      :shipping_cost,
      :total_payment,
      :status,
      :payment_method
    )
  end
end

