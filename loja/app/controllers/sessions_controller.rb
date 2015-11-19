class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end
  
  def create
    operator = Operator.find_by(email: params[:session][:email].downcase)
    if operator && operator.authenticate(params[:session][:password])
        session[:operator_id] = operator.id
        redirect_to admin_index_url
    else
        redirect_to login_url, alert: "Invalid operator/password combination"
    end
  end

  def destroy
    session[:operator_id] = nil
    redirect_to store_index_url, notice: "Logged out"
  end
end
