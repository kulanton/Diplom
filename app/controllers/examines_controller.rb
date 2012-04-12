class ExaminesController < ApplicationController

  def index
    @examines = Examine.all
  end


  def show
    @examine = Examine.find(params[:id])
  end


  def new
    @examine = Examine.new
  end


  def edit
    @examine = Examine.find(params[:id])
  end


  def create
    @examine = Examine.new(params[:examine])

    respond_to do |format|
      if @examine.save
        format.html { redirect_to blocks_url, :notice => 'Новый тест создан.' }
      else
        format.html { render :action => "new", :params => params[:block] }
      end
    end
  end


  def update
    @examine = Examine.find(params[:id])

    respond_to do |format|
      if @examine.update_attributes(params[:examine])
        format.html { redirect_to blocks_url, :notice => 'Тест отредактирован.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @examine = Examine.find(params[:id])
    @examine.destroy

    respond_to do |format|
      format.html { redirect_to examines_url }
    end
  end
  
  
  def sort
    params[:examine].each_with_index do |id, index|
      Examine.update_all(['ordinal=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
end
