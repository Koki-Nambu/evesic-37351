class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]

  def show
    @events = @user.events.order("created_at DESC")
    @user.url = @user.url.last(11)
  end


  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to "/users/#{current_user.id}"
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:nickname, :artist_name, :email, :image, :profile, :genre_id, :url, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

