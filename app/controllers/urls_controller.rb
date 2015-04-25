class UrlsController < ApplicationController
  def index
    @urls = Url.order(views: :desc).limit(100)
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to urls_path
    else
      render 'new'
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
end