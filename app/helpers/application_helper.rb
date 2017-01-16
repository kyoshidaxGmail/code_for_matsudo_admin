module ApplicationHelper
  def modify_time(time)
    return time.in_time_zone(session[:timezone_offset]).strftime('%Y.%m.%d %H:%M') if time.present?
    return '-'
  end
end
