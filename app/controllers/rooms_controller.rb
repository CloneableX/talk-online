class RoomsController < ApplicationController
  include CurrentUser

  before_action :set_current_user

  def show
    @number = params[:number]
  end
end
