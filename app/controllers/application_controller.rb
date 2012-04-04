class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  protect_from_forgery
  
  before_filter :check_user
  
  private
  def check_user
    @current_user=current_user
  end

  def check_regular_user
    unless @current_user
      #flash[:error] = "Доступ для незарегистрированных пользователей запрещен"
      #redirect_back_or_default '/'
      render 'sessions/new', :layout => 'login'
    end
  end

  def check_admin_user
    unless @current_user && @current_user.admin?
      flash[:error] = "Доступ запрещен"
      redirect_back_or_default '/'
      #render :text => "", :layout => 'application'
    end
  end
end
