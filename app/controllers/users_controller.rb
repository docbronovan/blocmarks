class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to current_user
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
