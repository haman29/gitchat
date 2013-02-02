# coding: utf-8
class MessageController < ApplicationController
  def create
    @partial_message = {
      :partial => 'message',
      :object  => [params[:room_id].to_s, params[:message].to_s]
    }
    respond_to do |format|
      format.js {render :layout => false} # create.js.erb
    end
  end
end
