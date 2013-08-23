require 'Util/Api/Marking/marking'

class AppController < ApplicationController
  def decide
    @refurl = CGI.escape( "#{params[:refurl]}" )
    @refurl_d = "#{params[:refurl]}"
    @reftitle = CGI.escape( "#{params[:reftitle]}" )
    @reftitle_d = "#{params[:reftitle]}"
  end

  def marking
    # パラメータ例
    # /app/marking?stamp=11&refurl=http%3A%2F%2Fwww.tv-asahi.co.jp%2F&title=%E3%83%86%E3%83%AC%E3%83%93%E6%9C%9D%E6%97%A5

    logfile = 'markingLog/output.log'
    actname = 'marking'

    formatter = Log4r::PatternFormatter.new(
      :pattern => "%M [%d] %C: %M",
      :date_format => "%Y/%m/%d %H:%M:%S"
    )
    # 日付ごとのファイルになるからNG
    #outputter = Log4r::DateFileOutputter.new(
    #  "file",
    #  :filename => logfile,
    #  :date_pattern => "%Y%m%d",
    #  :trunc => false,
    #  :formatter => formatter
    #)
    outputter = Log4r::FileOutputter.new(
      "file",
      :filename => logfile,
      :trunc => false,
      :formatter => formatter
    )
    logger4r = Log4r::Logger.new( actname )
    logger4r.add( outputter )

    logger4r.level = Log4r::DEBUG
    logger4r.trace = true

    # refurlはencodeURIComponent( document.location )
    # reftitleはencodeURIComponent( document.title )
    ip = request.env[ 'REMOTE_ADDR' ]
    logtext = "ip=\"" + ip + "\" stamp=\"#{params[:stamp]}\" refurl=\"#{params[:refurl]}\" reftitle=\"#{params[:title]}\" navigator=\"" + request.env["HTTP_USER_AGENT"] + "\""
    zyx = Marking::MarkingLog.new( actname, logfile )
    xyz = zyx.log( logtext )

    #@f = HogeMage.foo
    #logger4r.info( 'infosa ' + @f + ' ' + xyz )

    @refurl_d = "#{params[:refurl]}"
    @reftitle_d = "#{params[:title]}"
    @stamp = "#{params[:stamp]}"

  end
end
