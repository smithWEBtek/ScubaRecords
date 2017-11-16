class SitesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def show
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to site_path(@site)
    else
      render 'new'
    end
  end

  private

    def site_params
      params.require(:site).permit(:name, :location)
    end


end
