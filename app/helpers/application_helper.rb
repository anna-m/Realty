module ApplicationHelper
  def logged_in?
    @current_user.present?
  end
end
