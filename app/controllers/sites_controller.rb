require 'pry'
class SitesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:user_id] && current_user
      @sites = current_user.sites.order("created_at DESC")
    else
      @sites = Site.all.order("created_at DESC")
    end
  end

  def show
    if params[:user_id] && current_user
      @site = current_user.sites.find(params[:id])
    else
      @site = Site.find(params[:id])
    end
  end

  def new
    @site = current_user.sites.build
  end

  def create
    @site = current_user.sites.create!(site_params)
    #@site = current_user.sites.build(site_params)
    if @site.save
      #current_user.sites << @site
      redirect_to user_site_path(current_user, @site)
    else
      render 'new'
    end
  end

  def edit
    @site = current_user.sites.find(params[:id])
  end

  def update
    @site = current_user.sites.find(params[:id])
    if @site.update(site_params)
      redirect_to user_site_path(current_user, @site)
    else
      render 'edit'
    end
  end

  def destroy
    @site = current_user.sites.find(params[:id])
    @site.destroy
    redirect_to user_sites_path(current_user)
  end

  private

    def site_params
      params.require(:site).permit(:name, :location)
    end

end
