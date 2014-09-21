require 'wiringpi'

class RpiRfid::Reader < RpiRfid::Base

  private

  def run
    Thread.new do
      begin
        port = WiringPi::Serial.new(device, baud)
        while running?
          char = port.serialGetchar
          value = if char == -1 # timeout
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
