class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def current_user
    @current_user ||= User.where(u_id: session[:user_id]).first if session[:user_id]
  end

  helper_method :current_user

  def authenticate_user
    unless current_user
      redirect_to root_path,
                  flash: { error: 'You need to sign in first !' }
    end
  end
end
