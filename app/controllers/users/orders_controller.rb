class Users::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.save
    redirect_to users_confirm_path
  end

  private
  def order_params
    params.require(:order).permit(
      :user_id,
      :postal_code,
      :address,
      :name,
      :shipping_cost,
      :total_payment,
      :status,
      :payment_method
    )
  end
end

