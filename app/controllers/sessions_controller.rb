class SessionsController < ApplicationController
  def new;
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:user_return_to] || root_path
      cookies.delete(:user_return_to)
    else
      flash.now[:alert] = 'Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
