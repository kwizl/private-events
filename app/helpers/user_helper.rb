module UserHelper
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
