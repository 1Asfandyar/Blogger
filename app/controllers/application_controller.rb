# frozen_string_literal: true

# main application controller
class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    redirect_back(fallback_location: root_path, alert: 'Not authorized to perform this action')
  end

  def not_destroyed
    redirect_back(fallback_location: root_path, alert: 'Object not destroyed.')
  end

  def not_found
    redirect_back(fallback_location: root_path, alert: 'Record not found.')
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role_id firstname lastname])
  end
end
