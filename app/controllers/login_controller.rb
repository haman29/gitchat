# coding: utf-8
require 'net/https'
class LoginController < ApplicationController

  # GET /login
  # GET /login.json
  def index
    code = params[:code].to_s
    if code.empty?
      respond_to do |format|
        format.html { redirect_to '/' }
      end
    end

    # uri = ['https://', Settings.github.host, Settings.github.access_token_path].join
    # @post = Net::HTTP.post_form(URI.parse(uri), post_params)
    # https = Net::HTTP.new(Settings.github.host, 443)
    # https.use_ssl = true
    # https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # https.start { |w|
        # response = w.get('/')
          # puts response.body
    # }

    ###
    # access_token を取得するため，postリクエストする
    ###
    request = Net::HTTP::Post.new(
      Settings.github.path,
      {'Content-Type' =>'application/json'}, # initheader
    )
    request.body = {
      :client_id     => Settings.github.client_id,
      :client_secret => Settings.github.client_secret,
      :code          => code,
    }.to_json

    http = Net::HTTP.new(Settings.github.host, '443')
    http.use_ssl = true

    # 証明書を使わない
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    # for debug
    http.set_debug_output $stderr

    @response = nil
    http.start do |h|
      @response = h.request(request)
    end
    render :text => @response
  end

  def access_token
    text  = 'idパラメータ: '
    text += params[:id] ? params[:id] : 'undefined'
    render :text => text
    # @client = Octokit::Client.new(:login => "me",  :oauth_token => "oauth2token")
  end
end
