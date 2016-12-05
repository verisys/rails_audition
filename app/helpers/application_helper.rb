module ApplicationHelper
  def user_is_department_supervisor(supervisor_id)
    supervisor_id == @current_user.id
  end
end
