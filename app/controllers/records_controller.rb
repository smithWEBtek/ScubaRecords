class RecordsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_site, except: [:extreme_dives]
  before_action :find_record, only: [:edit, :update, :destroy]

  def index
    @site = Site.find(params[:site_id])
    @records = @site.records

    render 'records/index', :layout => false
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.site_id = @site.id
    @record.user_id = current_user.id
    if @record.save
      flash[:notice] = "Record was successfully created"
      redirect_to user_site_path(current_user, @site)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @record.update(record_params)
      flash[:notice] = "Record was successfully updated"
      redirect_to user_site_path(current_user, @site)
    else
      render 'edit'
    end
  end

  def destroy
    @record.destroy
    flash[:notice] = "Record was successfully deleted"
    redirect_to user_site_path(current_user, @site)
  end

  def extreme_dives
    @extreme_dives = Record.extreme_dives
  end

  private

    def record_params
      params.require(:record).permit(:date, :dive_time, :max_depth, :water_temperature, :activity, :notes, :site_id, :user_id)
    end

    def find_site
      @site = Site.find(params[:site_id])
    end

    def find_record
      @record = Record.find(params[:id])
    end
end
