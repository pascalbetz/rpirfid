require "rpi/rfid/version"

module Rpi
  module Rfid
  end
end

if RUBY_PLATFORM =~ /darwin/
  require_relative 'rfid/osx/reader'
else
  require_relative 'rfid/rpi/reader'
end

