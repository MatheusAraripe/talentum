class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_variables

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :category_id, :description, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :category_id, :description, :photo])
  end

  def set_variables
    @photo = Category.find_by(name: "Photography")
    @painting = Category.find_by(name: "Painting")
    @illustration = Category.find_by(name: "Illustration")
    @drawing = Category.find_by(name: "Drawing")
  end
end
