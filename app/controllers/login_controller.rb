# coding: utf-8
require 'net/https'
include LoginHelper

class LoginController < ApplicationController

  # GET /login
  # GET /login.json
  def index
    # redirect from /login/oauth/authorize
    if request.get?
      code = params[:code].to_s
      if code.empty?
        respond_to do |format|
          format.html { redirect_to '/' }
        end
      end

      ###
      # access_token を取得するため，postリクエストする
      ###
      request = Net::HTTP::Post.new(
        Settings.github.access_token_path,
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

      response = nil
      http.start do |h|
        response = h.request(request)
      end

      body = parse_response_body(response.body)
      if body['access_token']
        session[:access_token] = body['access_token']
      end

      respond_to do |format|
        format.html { redirect_to '/' }
      end

    # get 以外の場合はエラー
    else
      respond_to do |format|
        format.html { redirect_to '/' }
      end
    end
  end
end
