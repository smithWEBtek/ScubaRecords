class RecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @site = Site.find(params[:site_id])
    @record = Record.new
  end

  def create
    @site = Site.find(params[:site_id])
    @record = Record.new(record_params)
    @record.site_id = @site.id
    @record.user_id = current_user.id
    if @record.save
      redirect_to user_site_path(current_user, @site)
    else
      render 'new'
    end
  end

  def edit
    @site = Site.find(params[:site_id])
    @record = Record.find(params[:id])
  end

  def update
    @site = Site.find(params[:site_id])
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to user_site_path(current_user, @site)
    else
      render 'edit'
    end
  end

  def destroy
    @site = Site.find(params[:site_id])
    @record = @site.records.find(params[:id])
    @record.destroy
    redirect_to user_site_path(current_user, @site)
  end

  private

    def record_params
      params.require(:record).permit(:date, :dive_time, :max_depth, :water_temperature, :activity, :notes)
    end
end
