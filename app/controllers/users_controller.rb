class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end


  def edit
  end

  def update
    current_user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :artist_name, :email, :image, :profile, :genre_id, :url, :image)
  end
end

