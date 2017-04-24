module ApplicationHelper

  def log_in
    button_to "Log In", new_session_url, method: :get
  end

  def log_out
    button_to "Log Out", session_url, method: :delete
  end

  def auth_token
    auth = "<input type=\"hidden\" name=\"authenticity_token\" value=\"#{form_authenticity_token}\">"
    auth.html_safe
  end
end
