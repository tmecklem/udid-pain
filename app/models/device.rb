class Device < ActiveRecord::Base
  attr_accessible :friendly_name, :keep, :udid
end
