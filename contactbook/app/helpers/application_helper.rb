module ApplicationHelper
  def show_flash_messages
    html = ""
    safelist = [:notice, :alert, :error]

    flash.each do |key, value|
      next unless safelist.include?(key.to_sym) && value.present?
      html << "<div class='callout #{key}'><p class='text-center'>#{value}</p></div>"
    end
    html.html_safe
  end

  def signed_in_supervisor
  	@supervisor = Supervisor.find(1)
  end

  def supervisors_department
  	signed_in_supervisor.department.id.to_s == params[:department_id]
  end

  def inactive_link_text(inactiveable)
    inactiveable.inactive? ? 'Mark Active' : 'Mark Inactive'
  end

end
