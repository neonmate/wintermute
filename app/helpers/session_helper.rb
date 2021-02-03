module SessionHelper

  def signed_in?
    session[:uid].present?
  end

  def current_user
    User.find_by!(uid: session[:uid]) if signed_in?
  end

  def sign_in_link(label, options = {})
    link_to label, '/auth/github', options.reverse_merge(method: :post)
  end

end
