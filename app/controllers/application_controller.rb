class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # rescue_from Exception, :with => :error_render_method

  def error_render_method
    render :template => "public/404", :status => 404, :layout => false
    true
  end

end
