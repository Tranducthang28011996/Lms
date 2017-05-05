class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def default_url_options
    { locale: I18n.locale }
  end

  protected # can be access inside this and other children class

  def set_locale
    I18n.locale = params[:locale] if params[:locale]
  end

  def authenticate_user
    user_logged_in = false
    if session[:current_user_id]
      user_logged_in = User.where(id: session[:current_user_id]).exists? ? true : false
    end

    if user_logged_in
      @current_user = User.find(session[:current_user_id])
      return true
    else
      return redirect_to new_user_path(locale: I18n.locale)
    end
  end

  # check if user logged in or not.
  # if yes, prevent he from login and sign up page
  def login_user
    if session[:current_user_id]
      return redirect_to root_path(locale: I18n.locale)
    else
      return true
    end
  end
end
