class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
		user.save
    redirect_to user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path(user)
  end

  def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path, status: :see_other
	end

  private

  def user_params
    params.require(:user).permit(
			:first_name,
			:last_name,
			:mailing_address,
			:city,
			:state,
			:zipcode,
			:primary_phone,
      :alt_phone,
			:email,
			:preferred_contact
		)
  end
end
