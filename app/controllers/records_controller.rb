class RecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @record = Record.new
  end

  def create
    @site = Site.find(params[:site_id])
    @record = Record.new(record_params)
    @record.site_id = @site.id
    if @record.save
      redirect_to user_site_path(current_user, @site)
    else
      render 'new'
    end
  end

  def edit
    @record = Record.find(params[:id])
    @site = @record.site
  end

  def update
    @record = Record.find(params[:id])
    @site = @record.site
    if @record.update(record_params)
      redirect_to user_site_path(current_user, @site)
    else
      render 'edit'
    end
  end

  def delete
    @record = Record.find(params[:id])
    @record.destroy
    #redirect_to user_sites_path(current_user)
  end

  private

    def record_params
      params.require(:record).permit(:date, :dive_time, :max_depth, :water_temperature, :activity, :notes, :user_id, :site_id)
    end
end
