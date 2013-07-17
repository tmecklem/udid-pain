class Device < ActiveRecord::Base
  attr_accessible :friendly_name, :keep, :udid

  validates :udid, :presence => true, :uniqueness => true
end
