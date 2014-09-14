class UsersController < ApplicationController
  before_filter :require_login, :except => [:new, :create, :activate]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end

  def show_me
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
