class ApplicationController < ActionController::Base
  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end
  helper_method :current_user

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def per_page(resource, num)
    resource.all.page(params[:page]).per(num)
  end
end
