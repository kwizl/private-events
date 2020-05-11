class UsersController < ApplicationController
  before_action :user_authenticated, only: %i[index show]
  include UserHelper

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:name] = params[:name]
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.created_events
    @upcoming_events = @user.created_events.upcoming_events
    @past_events = @user.created_events.past_events
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

  def user_authenticated
    redirect_to root_path unless session[:name]
  end
end
