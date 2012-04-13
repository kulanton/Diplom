class BlocksController < ApplicationController

  def index
    if params[:discipline].nil?
      @blocks = Block.includes(:groups, :examines=>[:scripts]).all
    else
      @blocks = Block.where('discipline_id = ?', params[:discipline])
      @discipline = Discipline.find(params[:discipline])
    end
  end


  def show
    @block = Block.find(params[:id])
  end


  def new
    @block = Block.new
    @block.year = current_study_year
    @block.discipline_id = params[:discipline] unless params[:discipline].blank?
  end


  def edit
    @block = Block.find(params[:id])
  end


  def create
    @block = Block.new(params[:block])

    respond_to do |format|
      if @block.save
        format.html { redirect_to blocks_url, :notice => 'Новый блок создан.' }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @block = Block.find(params[:id])

    respond_to do |format|
      if @block.update_attributes(params[:block])
        format.html { redirect_to @block, :notice => 'Блок отредактирован.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @block = Block.find(params[:id])
    @block.destroy

    respond_to do |format|
      format.html { redirect_to blocks_url }
    end
  end


  def add_group
  end
  
  def add_examines
    block = Block.find(params[:id])
    block.examine_ids = params[:examine_ids]
    redirect_to blocks_url
  end
end
