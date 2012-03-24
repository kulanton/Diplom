class ScriptSubThemesController < ApplicationController
  # GET /script_sub_themes
  # GET /script_sub_themes.json
  def index
    @script_sub_themes = ScriptSubTheme.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @script_sub_themes }
    end
  end

  # GET /script_sub_themes/1
  # GET /script_sub_themes/1.json
  def show
    @script_sub_theme = ScriptSubTheme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @script_sub_theme }
    end
  end

  # GET /script_sub_themes/new
  # GET /script_sub_themes/new.json
  def new
    @script_sub_theme = ScriptSubTheme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @script_sub_theme }
    end
  end

  # GET /script_sub_themes/1/edit
  def edit
    @script_sub_theme = ScriptSubTheme.find(params[:id])
  end

  # POST /script_sub_themes
  # POST /script_sub_themes.json
  def create
    @script_sub_theme = ScriptSubTheme.new(params[:script_sub_theme])

    respond_to do |format|
      if @script_sub_theme.save
        format.html { redirect_to @script_sub_theme, :notice => 'Script sub theme was successfully created.' }
        format.json { render :json => @script_sub_theme, :status => :created, :location => @script_sub_theme }
      else
        format.html { render :action => "new" }
        format.json { render :json => @script_sub_theme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /script_sub_themes/1
  # PUT /script_sub_themes/1.json
  def update
    @script_sub_theme = ScriptSubTheme.find(params[:id])

    respond_to do |format|
      if @script_sub_theme.update_attributes(params[:script_sub_theme])
        format.html { redirect_to @script_sub_theme, :notice => 'Script sub theme was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @script_sub_theme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /script_sub_themes/1
  # DELETE /script_sub_themes/1.json
  def destroy
    @script_sub_theme = ScriptSubTheme.find(params[:id])
    @script_sub_theme.destroy

    respond_to do |format|
      format.html { redirect_to script_sub_themes_url }
      format.json { head :ok }
    end
  end
end
