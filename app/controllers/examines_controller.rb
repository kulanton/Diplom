class ExaminesController < ApplicationController
  before_filter :check_admin_user, :except=>['show', 'sort']

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
    params[:block] = @examine.block_ids

      if @examine.save
        redirect_to blocks_url, :notice => 'Новый тест создан.'
      else
        render :action => "new"
      end
  end


  def update
    @examine = Examine.find(params[:id])

      if @examine.update_attributes(params[:examine])
        redirect_to blocks_url, :notice => 'Тест отредактирован.'
      else
        render :action => "edit"
      end
  end


  def destroy
    @examine = Examine.find(params[:id])
    @examine.destroy

    redirect_to examines_url
  end
  
  
  def sort
    params[:examine].each_with_index do |id, index|
      Examine.update_all(['ordinal=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
end
