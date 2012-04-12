class RepositoryThemesController < ApplicationController

  def index
    if params[:term]
      @repository_themes = RepositoryTheme.where("lower(name) LIKE lower(?)", "%#{params[:term]}%")
    elsif params[:q]
      @repository_themes = RepositoryTheme.where("lower(name) LIKE lower(?)", "%#{params[:q]}%")
    else
      @repository_themes = RepositoryTheme.all
    end

    respond_to do |format|
      format.html
      format.json do
        render :json => @repository_themes.map(&:attributes) if params[:q]
        render :json => @repository_themes.map(&:name) if params[:term]
      end
    end
  end


  def show
    @repository_theme = RepositoryTheme.find(params[:id])
  end


  def new
    @repository_theme = RepositoryTheme.new
  end


  def edit
    @repository_theme = RepositoryTheme.find(params[:id])
  end


  def create
    @repository_theme = RepositoryTheme.new(params[:repository_theme])

    respond_to do |format|
      if @repository_theme.save
        format.html { redirect_to @repository_theme, :notice => 'Repository theme was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @repository_theme = RepositoryTheme.find(params[:id])

    respond_to do |format|
      if @repository_theme.update_attributes(params[:repository_theme])
        format.html { redirect_to @repository_theme, :notice => 'Repository theme was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @repository_theme = RepositoryTheme.find(params[:id])
    @repository_theme.destroy

    respond_to do |format|
      format.html { redirect_to repository_themes_url }
    end
  end
end
