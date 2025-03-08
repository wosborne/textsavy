class ApplicationController < ActionController::Base
  include Authentication
  before_action :redirect_to_setup_if_no_users_exist
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user
  def current_user
    @current_user ||= authenticated? && Current.session&.user
  end

  helper_method :current_blog
  def current_blog
    current_user&.blog
  end

  private

  def redirect_to_setup_if_no_users_exist
    redirect_to new_setup_path unless User.exists?
  end
end
