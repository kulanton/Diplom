class ScriptThemesController < ApplicationController
  # GET /script_themes
  # GET /script_themes.json
  def index
    @script_themes = ScriptTheme.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @script_themes }
    end
  end

  # GET /script_themes/1
  # GET /script_themes/1.json
  def show
    @script_theme = ScriptTheme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @script_theme }
    end
  end

  # GET /script_themes/new
  # GET /script_themes/new.json
  def new
    @script_theme = ScriptTheme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @script_theme }
    end
  end

  # GET /script_themes/1/edit
  def edit
    @script_theme = ScriptTheme.find(params[:id])
  end

  # POST /script_themes
  # POST /script_themes.json
  def create
    @script_theme = ScriptTheme.new(params[:script_theme])

    respond_to do |format|
      if @script_theme.save
        format.html { redirect_to @script_theme, :notice => 'Script theme was successfully created.' }
        format.json { render :json => @script_theme, :status => :created, :location => @script_theme }
      else
        format.html { render :action => "new" }
        format.json { render :json => @script_theme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /script_themes/1
  # PUT /script_themes/1.json
  def update
    @script_theme = ScriptTheme.find(params[:id])

    respond_to do |format|
      if @script_theme.update_attributes(params[:script_theme])
        format.html { redirect_to @script_theme, :notice => 'Script theme was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @script_theme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /script_themes/1
  # DELETE /script_themes/1.json
  def destroy
    @script_theme = ScriptTheme.find(params[:id])
    @script_theme.destroy

    respond_to do |format|
      format.html { redirect_to script_themes_url }
      format.json { head :ok }
    end
  end
end
