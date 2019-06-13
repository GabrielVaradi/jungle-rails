class UsersController < ApplicationController
  attr_accessor :first_name, :last_name, :email

  def new
    @user = User.new
end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:products], notice: 'Registered!'
      session[:user_id] = @user.id
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

private

    def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
    )
  end
end