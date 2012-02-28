class SubThemesController < ApplicationController
  # GET /sub_themes
  # GET /sub_themes.json
  def index
    @sub_themes = SubTheme.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sub_themes }
    end
  end

  # GET /sub_themes/1
  # GET /sub_themes/1.json
  def show
    @sub_theme = SubTheme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @sub_theme }
    end
  end

  # GET /sub_themes/new
  # GET /sub_themes/new.json
  def new
    @sub_theme = SubTheme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @sub_theme }
    end
  end

  # GET /sub_themes/1/edit
  def edit
    @sub_theme = SubTheme.find(params[:id])
  end

  # POST /sub_themes
  # POST /sub_themes.json
  def create
    @sub_theme = SubTheme.new(params[:sub_theme])

    respond_to do |format|
      if @sub_theme.save
        format.html { redirect_to @sub_theme, :notice => 'Подтема успешно создана.' }
        format.json { render :json => @sub_theme, :status => :created, :location => @sub_theme }
      else
        format.html { render :action => "new" }
        format.json { render :json => @sub_theme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sub_themes/1
  # PUT /sub_themes/1.json
  def update
    @sub_theme = SubTheme.find(params[:id])

    respond_to do |format|
      if @sub_theme.update_attributes(params[:sub_theme])
        format.html { redirect_to @sub_theme, :notice => 'Подтема успешно отредактрована.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @sub_theme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_themes/1
  # DELETE /sub_themes/1.json
  def destroy
    @sub_theme = SubTheme.find(params[:id])
    @sub_theme.destroy

    respond_to do |format|
      format.html { redirect_to sub_themes_url }
      format.json { head :ok }
    end
  end
end

