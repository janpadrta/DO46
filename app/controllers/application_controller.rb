class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_login
  before_filter :set_locale

  def not_authenticated
    redirect_to login_url, :alert => t('application.not_authenticated.alert')
  end

  protected

  def current_users_list
    current_users.map {|u| u.username}.join(", ")
  end
  helper_method :current_users_list

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale
  end

end
