class ApplicationController < ActionController::Base
  protect_from_forgery

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
end
