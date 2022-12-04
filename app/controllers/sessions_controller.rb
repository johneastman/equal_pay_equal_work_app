class SessionsController < ApplicationController
  def new
    # The user needs to be siged in to generate the PDF complaint form.
    #
    # I tried adding "before_action :require_signin, only: [:generate_complaint]" to the complaints controller, but
    # after signing in, the PDF form would not open in a new tab. The server logs said the request was successful,
    # but the browser was still displaying the signin page.
    #
    #
    # Instead, I did this: when the user is not signed in, they will see this on the
    # "employers/:employer_id/complaints/:complaint_id" page:
    #  [Sign in](signin_path) to generate the complaint form
    # 
    # When the user clicks that "Sign in" button, two URL query parameters are added: the employer id and the complaint
    # id. Both are used to set "intended_url" in the session hash, which, will redirect the user back to the complaint
    # page after signing in.
    #
    # After signing in, the user will see a "Generate Complaint" link, which generates the PDF form. 
    if params.key?(:employer) && params.key?(:complaint)
      session[:intended_url] = employer_complaint_path(params[:employer], params[:complaint])
    end
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      sign_in(user.id)

      # Redirect to intended url if signin is required to view a page. If 'session[:intended_url]' is empty
      # redirect to the employers path
      redirect_to (session[:intended_url] || employers_path), notice: "#{I18n.t("session.sign_in_success")}, #{user.first_name}!"
      session[:intended_url] = nil
    else
      # If the email doesn't match an existing user, redisplay the login page because login failed
      flash.now[:alert] = I18n.t("session.invalid_credentials")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out
    redirect_to employers_path, status: :see_other, notice: I18n.t("session.sign_out_success")
  end
end
