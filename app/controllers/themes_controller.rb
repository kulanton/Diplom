class ThemesController < ApplicationController

  def index
    @themes = Theme.all

    respond_to do |format|
      format.html
      format.json do
        @themes = Theme.where("lower(name) LIKE lower(?)","%#{params[:q]}%").all
        render :json => @themes.map(&:attributes)
      end
    end
  end


  def show
    @theme = Theme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @theme }
    end
  end


  def new
    @theme = Theme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @theme }
    end
  end


  def edit
    @theme = Theme.find(params[:id])
  end


  def create
    @theme = Theme.new(params[:theme])

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme, :notice => 'Тема успешно создана.' }
        format.json { render :json => @theme, :status => :created, :location => @theme }
      else
        format.html { render :action => "new" }
        format.json { render :json => @theme.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @theme = Theme.find(params[:id])

    respond_to do |format|
      if @theme.update_attributes(params[:theme])
        format.html { redirect_to @theme, :notice => 'Тема успешно отредактирована.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @theme.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy

    respond_to do |format|
      format.html { redirect_to themes_url }
      format.json { head :ok }
    end
  end
end
