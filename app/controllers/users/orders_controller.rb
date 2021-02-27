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
    if params[:flag] == '0'
      @order.name = current.user.name
      @order.postal_code = current.user.postal_code
      @order.address = current.user.address
      @order.telephone = current.user.telephone
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

