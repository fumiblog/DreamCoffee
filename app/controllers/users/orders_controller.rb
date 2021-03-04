class Users::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_user.addresses
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.status = 0
    @order.save
    current_user.cart_items.each do |f|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = f.item_id
      @order_detail.price = f.item.price
      @order_detail.amount = f.amount
      @order_detail.making_status = 0
      # byebug
      @order_detail.save!
    end
    @cart_items = current_user.cart_items
    @cart_items.destroy_all
    redirect_to complete_users_orders_path
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

  def index
    @orders = current_user.orders
    @list_name = 0
    if params[:order_id] === nil
      @quantity_sold = OrderDetail.group(:item_id).sum(:amount)
      @order_details = OrderDetail.order('created_at desc').limit(10)
      @list_name = "売筋商品上位10位"
    else
      @order_details = OrderDetail.where(order_id: params[:order_id])
      @list_name = "商品詳細"
    end
    byebug
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
  def order_detail_params
    params.require(:order_detail).permit(
      :order_id,
      :item_id,
      :price,
      :amount,
      :making_status)
  end
  def address_params
    params.require(:address).permit(
      :customer_id,
      :name,
      :address,
      :postal_code)
  end
end

