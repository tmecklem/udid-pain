module Api
  module V1
    class Api::V1::DevicesController < ApplicationController

      respond_to :json

      def status
        udid = params[:udid]
        @device = Device.find_by_udid(udid)
      end

      def register
        udid = params[:udid]
        friendly_name = params[:friendly_name]

        @device = Device.find_by_udid(udid) || Device.new({udid: udid})

        @registered = false
        if @device.nil?
          return
        end

        @device.friendly_name = friendly_name
        @device.keep = true

        if @device.save
          @registered = true
        end

      end
    end

  end
end
