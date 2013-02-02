class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_logined

  def initialize
    super
    @github_login_url = URI::HTTPS.build({
      :host => Settings.github.host,
      :path => Settings.github.auth_path,
      :query => [
        [
          'client_id', Settings.github.client_id
        ].join('='),
      ].join('&'),
    }).to_s
  end

  private
  def check_logined
    if session[:access_token] then
      client = Octokit::Client.new(:login => "me",  :oauth_token => session[:access_token])
      @user = client.user
    end
    # unless @user
      # redirect_to '/'
    # end
  end
end
