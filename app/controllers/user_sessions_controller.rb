class UserSessionsController < ApplicationController
  def create
    if find_user
      session[:name] = params[:name]
      session[:id] = @user.id

      redirect_to(users_path, notice: 'Logged in successfully.')
    else
      flash.now.alert = 'Login failed.'
      render action: :new
    end
  end

  def destroy
    # logout
    redirect_to(:users, notice: 'Logged out!')
  end

  private

  def find_user
    @user = User.find_by(name: params[:name])
  end
end
