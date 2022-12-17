class RoomsController < ApplicationController
  include CurrentUser

  before_action :set_current_user

  def new; end

  def create
    room = Room.create
    redirect_to room_number_url(room)
  end

  def show
    @number = params[:number]
  end
end
