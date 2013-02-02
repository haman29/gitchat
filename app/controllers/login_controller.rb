class LoginController < ApplicationController

  # GET /login
  # GET /login.json
  def index
    @client = Octokit::Client.new(:login => "me",  :oauth_token => "oauth2token")
    # render :text => @client

    # client.follow("sferik")
    # respond_to do |format|
      # format.html # index.html.erb
      # format.json { render json: @client }
    # end
  end
end
