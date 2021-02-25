class ApplicationController < ActionController::Base

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(
        :signup, keys: [
          :name,
          :postal_code,
          :address,
          :telephone
        ]
      )
    end

  private
    def current_cart
      CartItem.find(session[:cart_item_id])
    rescue ActiveRecord::RecordNotFound
      cart_item = CartItem.create
      session[:cart_item_id] = cart_item.id
      cart_item
    end
end
