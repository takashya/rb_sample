class HelloController < ApplicationController
  def index
    render text: 'Hello World!'
  end

  def to
    @message = " Hello #{params[:name]} ! "
  end

  def test1
    @test1 = " test1 #{params[:p1]} #{params[:p2]}"
  end
end
