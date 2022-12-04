class ApplicationController < ActionController::Base
  private

  # Stub current user
  def current_user
    User.first
  end
end
