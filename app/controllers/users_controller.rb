class UsersController < ApplicationController

  def index
    @user = User.find(params[:id])
    @sites = current_user.sites.all.order("created_at DESC")
  end

  def show
    @user = User.find(params[:id])
  end

end
