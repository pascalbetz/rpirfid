# Rpi::Rfid

A tiny wrapper for Parallax RFID reader on Raspberry PI. It uses a thread to make it look like it's non-blocking.

## Installation

Add this line to your application's Gemfile:

    gem 'rpirfid'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rpirfid

## NOTE

For debugging purpose there is also a OS X Variant of the reader which gets automatically loaded when the code is running on OS X. This was added for figuring our how to decode the data sent by the reader. But i thought it might be useful. It uses the 'serialport' gem which is NOT in the gemfile. You need to install it.

When stopping the reader it might actually take some seconds until it follows your orders. This is because i could not find a way to configure the read timeout on wiringpi.


## Usage


reader = RpiRfid::Reader.new('/dev/mydevice')
reader.on_id_read do |id|
  puts "somebody just flashed the RFID tag with ID #{id}"
end

reader.start
...
...
reader.stop # might take some second


## Contributing

1. Fork it ( https://github.com/[my-github-username]/rpi-rfid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
