class DevicesController < ApplicationController
  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devices }
    end
  end

  def update_for_keep
    @device = Device.find(params[:id])
  end

  def keep
    @device = Device.find(params[:id])
    @device.friendly_name = params[:device][:friendly_name]
    @device.keep = true
    @device.save

    redirect_to :action => "index"
  end

end
