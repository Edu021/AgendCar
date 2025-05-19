class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def current_user
    @current_user ||= Client.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_logged_in?
    current_user.present?
  end

  def authenticate_user!
    redirect_to '/register', alert: 'Você precisa estar logado para acessar esta página.' unless user_logged_in? || devise_controller? || allowed_public_path?
  end

  # Helper method to allow access to specific paths without authentication
  def allowed_public_path?
    # Add any paths that should be publicly accessible without login
    # For example, the registration page, login page, etc.
    request.path == '/register' || request.path == '/login' || request.path.starts_with?('/api/login') || request.path.starts_with?('/api/register')
  end

  # If you are using Devise, Devise controllers should be skipped.
  # If not using Devise, this method can be simplified or removed if not needed.
  def devise_controller?
    # This checks if the current controller is a Devise controller.
    # You might need to adjust this if your Devise setup is different or if you're not using Devise.
    false # Assuming not using Devise by default, change if you are.
  end

  helper_method :current_user, :user_logged_in?
end
