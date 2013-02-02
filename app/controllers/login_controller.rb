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

    # access_token を取得するため，postリクエストする
    uri = ['https://', Settings.github.host, Settings.github.access_token_path].join
    post_params = {
      :client_id     => Settings.github.client_id,
      :client_secret => Settings.github.client_secret,
      :code          => code,
    }
    p URI.parse(uri)
    p post_params
    @post = Net::HTTP.post_form(URI.parse(uri), post_params)
    # render :text => post
  end

  def access_token
    text  = 'idパラメータ: '
    text += params[:id] ? params[:id] : 'undefined'
    render :text => text
    # @client = Octokit::Client.new(:login => "me",  :oauth_token => "oauth2token")
  end
end
