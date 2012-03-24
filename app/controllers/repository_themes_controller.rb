class RepositoryThemesController < ApplicationController
  # GET /repository_themes
  # GET /repository_themes.json
  def index
    @repository_themes = RepositoryTheme.all

    respond_to do |format|
      format.html # index.html.erb
      format.json do
        @repository_themes = RepositoryTheme.where("lower(name) LIKE lower(?)", "%#{params[:q]}%").all
        render :json => @repository_themes.map(&:attributes)
      end
    end
  end

  # GET /repository_themes/1
  # GET /repository_themes/1.json
  def show
    @repository_theme = RepositoryTheme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @repository_theme }
    end
  end

  # GET /repository_themes/new
  # GET /repository_themes/new.json
  def new
    @repository_theme = RepositoryTheme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @repository_theme }
    end
  end

  # GET /repository_themes/1/edit
  def edit
    @repository_theme = RepositoryTheme.find(params[:id])
  end

  # POST /repository_themes
  # POST /repository_themes.json
  def create
    @repository_theme = RepositoryTheme.new(params[:repository_theme])

    respond_to do |format|
      if @repository_theme.save
        format.html { redirect_to @repository_theme, :notice => 'Repository theme was successfully created.' }
        format.json { render :json => @repository_theme, :status => :created, :location => @repository_theme }
      else
        format.html { render :action => "new" }
        format.json { render :json => @repository_theme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /repository_themes/1
  # PUT /repository_themes/1.json
  def update
    @repository_theme = RepositoryTheme.find(params[:id])

    respond_to do |format|
      if @repository_theme.update_attributes(params[:repository_theme])
        format.html { redirect_to @repository_theme, :notice => 'Repository theme was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @repository_theme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /repository_themes/1
  # DELETE /repository_themes/1.json
  def destroy
    @repository_theme = RepositoryTheme.find(params[:id])
    @repository_theme.destroy

    respond_to do |format|
      format.html { redirect_to repository_themes_url }
      format.json { head :ok }
    end
  end
end
