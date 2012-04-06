class ExaminesController < ApplicationController

  def index
    @examines = Examine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @examines }
    end
  end


  def show
    @examine = Examine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @examine }
    end
  end


  def new
    @examine = Examine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @examine }
    end
  end


  def edit
    @examine = Examine.find(params[:id])
  end


  def create
    @examine = Examine.new(params[:examine])
    
    @examine.block_ids << params[:blocks][0]

    respond_to do |format|
      if @examine.save
        format.html { redirect_to @examine, :notice => 'Тест успешно создан.' }
        format.json { render :json => @examine, :status => :created, :location => @examine }
      else
        format.html { render :action => "new" }
        format.json { render :json => @examine.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @examine = Examine.find(params[:id])

    respond_to do |format|
      if @examine.update_attributes(params[:examine])
        format.html { redirect_to @examine, :notice => 'Тест успешно отредактирован.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @examine.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @examine = Examine.find(params[:id])
    @examine.destroy

    respond_to do |format|
      format.html { redirect_to examines_url }
      format.json { head :ok }
    end
  end
end
