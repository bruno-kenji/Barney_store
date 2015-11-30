class ApplicationController < ActionController::Base
  before_action :authorize
  helper_method :logged_in
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def authorize
    unless logged_in
      redirect_to login_url, alert: "Please login to access admin content"
    end
  end

  def authorize_full_access
    unless logged_in && logged_in.sector.id == 7 && logged_in.sector.title == 'Admin'
      redirect_to admin_index_url, alert: "Only operators who belong in the 'Admin' sector have access to this."
    end
  end

  def logged_in
    logged_in = Operator.find_by(id: session[:operator_id])
  end

  def redirect_to_back(default = root_url)
    if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to default
    end
  end
end