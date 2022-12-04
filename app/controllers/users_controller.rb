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
    # When the user creates an account, they only have to provide an email and password. The remaining contact info is optional
    # because they may want to only submit anonymous forms. If they do decide to submit non-anonymous forms, they will need ti
    # edit/add this info.
    user = User.new(params.require(:user).permit(:email, :password))
		
    if user.save
      sign_in(user.id)
      redirect_to user
    else
      render :new, status: :unprocessable_entity
    end
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
    sign_out
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
			:preferred_contact,
      :password
		)
  end
end
