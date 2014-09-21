require 'wiringpi'

class Rpi::Rfid::Reader < Rpi::Rfid::Base
  def start
    Thread.new do
      begin
        port = WiringPi::Serial.new(device, baud)
        while running?
          char = port.serialGetchar
          value = if char == -1
            nil
          else
            char.chr
          end
          data_read(value)
        end
      ensure
        port.serialClose
      end
    end
  end
end
