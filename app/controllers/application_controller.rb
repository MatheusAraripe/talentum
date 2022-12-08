class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_variables

  before_action :authenticate_user!
  include Pundit::Authorization

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

  # Pundit: allow-list approach
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
