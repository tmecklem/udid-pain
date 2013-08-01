class Device < ActiveRecord::Base
  attr_accessible :friendly_name, :keep, :udid

  validates :udid, :presence => true, :uniqueness => true
  validates :friendly_name, :presence => true, :length => { :minimum => 5 }
end
