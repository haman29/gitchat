# coding: utf-8
class MessageController < ApplicationController
  def index
    PrivatePub.publish_to("/message", :message => 'IN')
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def create
    # PrivatePub.publish_to("/message", :message => params[:message].to_s)
    # render :text => 'aaa'
    @partial_message = {:partial => 'message', :object => params[:message].to_s}
    respond_to do |format|
      format.js {render :layout => false} # create.js.erb
    end
  end
end
