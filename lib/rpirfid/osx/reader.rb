require 'serialport'

class RpiRfid::Reader < RpiRfid::Base
  private

  def run
    Thread.new do
      SerialPort.open(device, 'baud' => baud) do |port|
        port.read_timeout = 1000
        while running?
          char = port.read(1)
          data_read(char)
        end
      end
    end
  end
end
