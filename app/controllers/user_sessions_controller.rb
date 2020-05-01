class UserSessionsController < ApplicationController
  def new; end

  def create
    if find_user
      session[:name] = params[:name]
      session[:id] = @current_user.id

      redirect_to(users_path, notice: 'Logged in successfully.')
    else
      flash.now.alert = 'Login failed.'
      render action: :new
    end
  end

  def destroy
    reset_session
    redirect_to(:users, notice: 'Logged out!')
  end

  private

  def find_user
    @current_user = User.find_by(name: params[:name])
  end
end
