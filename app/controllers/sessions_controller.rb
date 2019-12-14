class SessionsController < ApplicationController
  before_action :deny_access_to_authorized, only: %i[new create]
  def new; end

  def create
    user = User.find_by_name(params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/main'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
