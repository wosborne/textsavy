class SetupsController < ApplicationController
  allow_unauthenticated_access
  skip_before_action :redirect_to_setup_if_no_users_exist

  before_action :redirect_if_any_user_exists

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      User.authenticate_by(user_params.slice(:email_address, :password))
      start_new_session_for @user

      redirect_to root_path, notice: "User created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end

  def redirect_if_any_user_exists
    redirect_to root_path if User.exists?
  end
end
