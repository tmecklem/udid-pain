object false
node(:registered) {|m| !@device.nil? && @device.keep || false}
node(:friendly_name) {|m| !@device.nil? ? @device.friendly_name : nil}