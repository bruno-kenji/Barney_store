class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end
  
  def create
    operator = Operator.find_by(email: params[:email])
    if operator and operator.authenticate(params[:password])
        session[:operator_id] = operator.id
        redirect_to store_url
    else
        redirect_to login_url, alert: "Invalid operator/password combination"
    end
  end

  def destroy
    session[:operator_id] = nil
    redirect_to store_url, notice: "Logged out"
  end
end
