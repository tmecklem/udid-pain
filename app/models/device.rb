class Device < ActiveRecord::Base
  attr_accessible :friendly_name, :keep, :udid

  validates :udid, :uniqueness => true, :length => { :minimum => 35 }
  validates :friendly_name, :length => { :minimum => 5 }
end
