class Rpi::Rfid::Base
  attr_reader :device, :baud

  def initialize(device)
    @baud = 2400
    @device = device
    @running = true
  end

  def on_id_read(&block)
    @callbacks ||= []
    @callbacks << block
    nil
  end

  def start
    raise "implemenent in subclass"
  end

  def stop
    @running = false
  end

  def running?
    @running
  end

  private

  def data_read(data)
    case data
    when nil                  # timeout
    when "\n" then id_start   # start of id
    when "\r" then id_end     # end of id
    else id_data(data)        # data of id
    end
  end

  def id_start
    @buffer = ''
  end

  def id_end
    if @buffer && @buffer.length == 10
      id = decode(@buffer)
      @callbacks.each do |callback|
        callback.call(id)
      end
    end
  end

  def id_data(data)
    if @buffer
      @buffer << data
    end
  end

  def decode(data)
    data[2..9].to_i(16)
  end

end