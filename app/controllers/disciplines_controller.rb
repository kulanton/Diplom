class DisciplinesController < ApplicationController
  before_filter :check_regular_user
  before_filter :check_admin_user, :except=>['index', 'show']

  def index
    @disciplines = Discipline.includes(:repository_themes, :blocks => [:examines]).search(params[:search]).order(:name)

    respond_to do |format|
      format.html
      format.js do
        @disciplines = Discipline.where("lower(name) LIKE lower(?)","%#{params[:term]}%").all
        render :json => @disciplines.map(&:name)
      end
      format.json do
        @disciplines = Discipline.where("lower(name) LIKE lower(?)","%#{params[:q]}%").all
        render :json => @disciplines.map(&:attributes)
      end
    end
  end


  def show
    @discipline = Discipline.find(params[:id])
  end


  def new
    @discipline = Discipline.new
  end


  def edit
    @discipline = Discipline.find(params[:id])
  end


  def create
    @discipline = Discipline.new(params[:discipline])

    respond_to do |format|
      if @discipline.save
        format.html { redirect_to disciplines_path, :notice => 'Новая дисциплина создана.' }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @discipline = Discipline.find(params[:id])

    respond_to do |format|
      if @discipline.update_attributes(params[:discipline])
        format.html { redirect_to @discipline, :notice => 'Дисциплина отредактирована.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @discipline = Discipline.find(params[:id])
    @discipline.destroy

    respond_to do |format|
      format.html { redirect_to disciplines_url }
    end
  end
end
