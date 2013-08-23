# coding: utf-8

class BooklistController < ApplicationController

  def hello
    #render "booklist/hello"
    @msg = 'こんにちは。こんばんわ。'
  end

  def bye
    render :text => 'bye!'
  end

  def titles
    @titles = Title.all
  end

end
