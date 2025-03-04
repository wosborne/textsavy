class ApplicationController < ActionController::Base
  include Authentication
  before_action :setup_initial_user
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user
  def current_user
    @current_user ||= authenticated? && Current.session&.user
  end

  private

  def setup_initial_user
    redirect_to new_setup_path unless User.exists?
  end
end
