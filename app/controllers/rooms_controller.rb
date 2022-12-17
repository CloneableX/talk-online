class RoomsController < ApplicationController
  include CurrentUser

  before_action :set_current_user

  def show
    @number = params[:number]
  end

  def create
    room = Room.create
    redirect_to room_number_url(room.id)
  end
end
