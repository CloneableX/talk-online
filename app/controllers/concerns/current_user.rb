# frozen_string_literal: true

module CurrentUser
  private

  def set_current_user
    User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = User.create.id
  end
end
