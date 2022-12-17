class SessionsController < ApplicationController
  def create
    redirect_to room_path(params[:room_number]&.upcase)
  end
end
