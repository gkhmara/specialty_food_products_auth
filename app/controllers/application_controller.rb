class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :is_admin?

  def is_admin?
    current_user && current_user.admin
  end

end
