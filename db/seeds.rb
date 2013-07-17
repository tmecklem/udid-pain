# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
list = []
File.open("db/device_list.txt", "r") do |infile| 
  while(line = infile.gets) 
    l = line.split("\t")
    list << {friendly_name: l[0], udid: l[1]}
  end
end

list.each do |entry|
  Device.create(entry)
end