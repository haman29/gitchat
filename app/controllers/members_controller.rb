# coding: utf-8
class MembersController < ApplicationController
  def add
    @partial_message = {
      :partial => 'members',
      :room_id  => params[:room_id].to_s
    }
    respond_to do |format|
      format.js {render :layout => false} # create.js.erb
    end
  end
end
