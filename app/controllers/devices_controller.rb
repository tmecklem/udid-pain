class DevicesController < ApplicationController
  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.order(:friendly_name)

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
    if @device.save
      redirect_to :action => "index"
    else
      render :action => "update_for_keep"
    end
  end

  def search

  end

  def perform_search
    @identifier = params[:device][:identifier]
    @devices = Device.where("udid LIKE ? or friendly_name LIKE ?", "%#{@identifier}%", "%#{@identifier}%").order(:friendly_name)
    render :action => "index"
  end

  def add_device
    @device = Device.new
  end

  def save_device
    @device = Device.new(params[:device])
    @device.keep = true
    if @device.save 
      flash[:notice] = "Successfully added device"
      redirect_to :action => :index
    else
      render :action => :add_device
    end
  end

  def export
    @devices = Device.where(:keep => true)

    filename = "devices-#{DateTime.now.to_s}"
    tempfile = Tempfile.new(filename)

    File.open(tempfile.path, "w") do |export_file|
      export_file.write "Device ID\tDevice Name\n"
      @devices.each do |device|
        export_file.write "#{device.udid}\t#{device.friendly_name}\n"
      end
    end

    send_file tempfile.path, :type => 'application/txt', :disposition => 'attachment', :filename => filename

  end

end
