module Marking

  require 'log4r'
  class MarkingLog

    def initialize appname, filename
      formatter = Log4r::PatternFormatter.new(
        :pattern => "[%d] %C: %M",
        :date_format => "%Y/%m%d %H:%M:%S"
      )
      outputter = Log4r::FileOutputter.new(
        "file",
        :filename => filename,
        :trunc => false,
        :formatter => formatter
      )
      @fs = Log4r::Logger.new( appname )
      @fs.add( outputter )
      @fs.level = Log4r::DEBUG
      @fs.trace = true
    end

    def log argv
      @fs.info( argv )
      #"Making::log " + argv
    end

  end

end
