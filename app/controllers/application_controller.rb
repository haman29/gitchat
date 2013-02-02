class ApplicationController < ActionController::Base
  protect_from_forgery

  # Constances
  OWN_HOST         = 'localhost:3000'
  GITHUB_HOST      = 'github.com'
  GITHUB_AUTH_PATH = '/login/oauth/authorize'
  GITHUB_CLIENT_ID = 'ae7476fc103f4df71037'
  GITHUB_LOGIN_URL = URI::HTTPS.build({
    :host => GITHUB_HOST,
    :path => GITHUB_AUTH_PATH,
    :query => [
      [
        'client_id',
        GITHUB_CLIENT_ID
      ].join('='),
      [
        'redirect_uri', [
          'http://', OWN_HOST, '/login/'
        ].join
      ].join('='),
    ].join('&'),
  }).to_s

end
