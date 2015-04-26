module UrlsHelper

  def shortened_full(url)
    "#{request.protocol}#{request.host_with_port}/" + url.shortened
  end

  def shortened_no_protocal(url)
    request.host_with_port + "/" + url.shortened
  end

end
