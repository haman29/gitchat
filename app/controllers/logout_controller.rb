class LogoutController < ApplicationController
  def index
    reset_session
    redirect_to '/'
  end
end
