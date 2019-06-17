class SessionController < ApplicationController
  def new


  end

  def create

    if user = User.authenticate_with_credentials(params[:email], params[:password])
    # If the user exists AND the password entered is correct.
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
      flash[:notice] = "Logged in"
    else
    if !user
    # If user's login doesn't work, send them back to the login form.
      flash[:error] = "This email doesn't exist"
      redirect_to '/login'
    else
      flash[:error] = "Wrong password"
      redirect_to '/login'
    end
  end
end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
