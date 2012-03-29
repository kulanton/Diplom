class ScriptsController < ApplicationController

  def index
    @scripts = Script.includes(:test).all
  end

  def show
    @script = Script.includes(:test).find(params[:id])
  end

  def new
    @script = Script.new
    #script_theme = @script.script_themes.build
    #script_theme.script_sub_themes.build
  end

  def edit
    @script = Script.find(params[:id])
  end

  def create
    @script = Script.new(params[:script])

    respond_to do |format|
      if @script.save
        format.html { redirect_to @script, :notice => 'Сценарий успешно создан.' }
        format.json { render :json => @script, :status => :created, :location => @script }
      else
        format.html { render :action => "new" }
        format.json { render :json => @script.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @script = Script.find(params[:id])

    respond_to do |format|
      if @script.update_attributes(params[:script])
        format.html { redirect_to @script, :notice => 'Сценарий успешно отредактирован.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @script.errors, :status =>  :unprocessable_entity }
      end
    end
  end

  def destroy
    @script = Script.find(params[:id])
    @script.destroy

    respond_to do |format|
      format.html { redirect_to scripts_url }
      format.json { head :ok }
    end
  end
end
