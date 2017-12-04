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

  private

    def record_params
      params.require(:record).permit(:date, :dive_time, :max_depth, :water_temperature, :activity, :notes)
    end
end
