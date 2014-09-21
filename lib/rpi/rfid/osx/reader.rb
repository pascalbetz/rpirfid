require 'serialport'

class Rpi::Rfid::Reader < Rpi::Rfid::Base
  def start
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
