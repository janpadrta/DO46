class SessionsController < ApplicationController
  before_filter :require_login, :except => [:new, :create]

  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice => t('sessions.create.loggedin')
    else
      flash.now.alert = t('sessions.create.mail_invalid')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => t('sessions.destroy.logout')
  end
end
