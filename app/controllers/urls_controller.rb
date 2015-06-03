class UrlsController < ApplicationController

  before_action :set_top_100, only: [:new, :create]

  def new
    @url = Url.new
  end

  def create
    @url = Url.my_find_or_build_by(url_params)
    if @url.save
      render :file => "/urls/create.js.erb"
    else
      render :file => "/urls/invalid.js.erb"
    end
  end

  def show
    @url = Url.find_by(:shortened => params[:id])
    @url.increment_view_count
    redirect_to @url.original
  end

  private
    def url_params
      params.require(:url).permit(:original)
    end

    def set_top_100
      @urls = Url.order(views: :desc).limit(100)
    end
end