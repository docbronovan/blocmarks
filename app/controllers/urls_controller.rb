class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
