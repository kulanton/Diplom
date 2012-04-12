class GroupsController < ApplicationController

  def index
    @groups = Group.order(:name)

    respond_to do |format|
      format.html
      format.json do
        @groups = Group.where("lower(name) LIKE lower(?)", "%#{params[:q]}%").all
        render :json => @groups.map(&:attributes)
      end
    end
  end


  def show
    @group = Group.find(params[:id])
  end


  def new
    @group = Group.new
  end


  def edit
    @group = Group.find(params[:id])
  end


  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, :notice => 'Новая группа создана.' }
      else
        format.html { render :action => "new" }
      end
    end
  end


  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, :notice => 'Группа отредактирована.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
    end
  end
end
