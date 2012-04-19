class BlocksController < ApplicationController
  before_filter :check_regular_user
  before_filter :check_admin_user, :except=>['index', 'show']

  def index
    if params[:discipline_id].nil?
      @blocks = Block.includes(:discipline, :groups, :examines=>[:scripts]).all
      @block_disciplines = @blocks.group_by { |b| b.discipline.name }
    else
      @blocks = Block.where('discipline_id = ?', params[:discipline_id])
      @discipline = Discipline.find(params[:discipline_id])
    end
  end


  def show
    @block = Block.find(params[:id])
  end


  def new
    @block = Block.new
    @block.year = current_study_year
    @block.discipline_id = params[:discipline_id] unless params[:discipline_id].blank?
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
  
  def year
    respond_to do |format|
      format.json { render :json => select_year }
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
