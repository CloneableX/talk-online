class RoomsController < ApplicationController
  include CurrentUser

  before_action :set_current_user, :check_number, only: [:show]

  def new; end

  def create
    room = Room.create
    redirect_to room_number_url(room)
  end

  def show
    @number = params[:number]
  end

  private

  def check_number
    room = Room.find_by(number: params[:number])
    if  room.blank?
      flash[:error] = 'Room number is not exists! Please input again.'
      redirect_to root_url if room.blank?
    end
  end
end
