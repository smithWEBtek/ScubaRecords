class SitesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @sites = Site.all.order("created_at DESC")
  end

  def show
    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new
  end

  def create
    @site = current_user.sites.build(site_params)
    if @site.save
      redirect_to site_path(@site)
    else
      render 'new'
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to site_path(@site)
    else
      render 'edit'
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to root_path
  end

  private

    def site_params
      params.require(:site).permit(:name, :location)
    end

end
