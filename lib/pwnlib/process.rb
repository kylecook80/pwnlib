class ProcessRun
  require 'open3'
  
  def initialize stdin, stdout
    @stdin = stdin
    @stdout = stdout
    @output_buf = []

    @get_input = true
    @stdout_thr = Thread.new do
      while @get_input
        data = @stdout.readpartial(4096)
        if data
          lines = data.split("\n")
          @output_buf += lines
        end
      end
    end
  end

  def output
    sleep 0.1
    @output_buf.each {|l| puts l; }
    output_clear
  end

  def raw_buffer
    sleep 0.1
    @output_buf
  end

  def output_clear
    sleep 0.1
    @output_buf = []
  end

  def recv
    sleep 0.1
    @output_buf.shift
  end

  def send msg
    @stdin.write msg
    sleep 0.1
  end

  def write msg
    File.open("sploit", "w") do |f|
      f.puts msg
    end
  end

  def interactive
    while 1
      print "\n$> "
      input = gets.chomp

      if input == "exit" or input == "quit"
        break
      end

      @stdin.puts(input)

      sleep 0.1
      output
    end
  end

  def close
    @stdout.flush
    @stdin.flush
    @get_input = false

    output

    @stdin.close
    @stdout.close unless @stdin == @stdout
  end
end
