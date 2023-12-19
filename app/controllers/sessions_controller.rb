class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.authenticate_with_credentials(params[:session][:email], params[:session][:password])
    
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!"
    else 
      flash.now[:alert] = "Email or password is invalid"
      render :new
    end 
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out!"
  end
end
