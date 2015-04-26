module UrlsHelper

  def shortened_full(url)
    "https://localhost:3000/"+ url.shortened
  end
end
