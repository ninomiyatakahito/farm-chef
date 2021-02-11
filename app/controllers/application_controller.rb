class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
  
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :kana_name, :birthday, :post_code, :prefecture, :city, :street, :business_name, :profile, :avatar, :kind])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :kana_name, :birthday, :post_code, :prefecture, :city, :street, :business_name, :profile, :avatar, :kind])
  end
end
