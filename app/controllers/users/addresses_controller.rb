class Users::AddressesController < ApplicationController
  def index
    @addresses = current_user.addresses
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    @address.save
    redirect_to users_addresses_path(current_user.id)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to users_addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to users_addresses_path
  end

  private
  def address_params
    params.require(:address).permit(
      :user_id,
      :name,
      :postal_code,
      :address,
      :telephone
    )
  end
end
