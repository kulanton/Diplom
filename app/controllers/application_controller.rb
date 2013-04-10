# -*- coding: utf-8 -*-
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
      flash[:error] = 'Доступ запрещен'
      redirect_back_or_default '/'
      #render :text => "", :layout => 'login'
    end
  end
  
  def current_study_year
    current_year = Time.now.year.to_i
    current_month = Time.now.month.to_i
    if current_month < 9
      (current_year-1).to_s + "/" + current_year.to_s
    else
      current_year.to_s + "/" + (current_year+1).to_s
    end
  end
  
  def select_year
    current_study_year_start, current_study_year_end = current_study_year.split('/').map{|s| s.to_i}
    res = []
    for i in -2..2
      res << "#{current_study_year_start+i}/#{current_study_year_end+i}"
    end
    res
  end
end

