module RpiRfid
end
require_relative "rpirfid/version"
require_relative "rpirfid/base"

if RUBY_PLATFORM =~ /darwin/
  require_relative 'rpirfid/osx/reader'
else
  require_relative 'rpirfid/rpi/reader'
end

