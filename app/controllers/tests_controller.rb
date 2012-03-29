class TestsController < ApplicationController

  def index
    if params[:discipline].nil? and params[:group].nil?
      @tests = Test.all
    elsif !params[:group].nil?
      @tests = Test.includes(:disciplines_groups).where("disciplines_groups.group_id = ?", params[:group])
    else
      @tests = Test.includes(:disciplines_groups).where("disciplines_groups.discipline_id = ? AND disciplines_groups.group_id = ?", params[:discipline], params[:group])
    end
  end


  def show
    @test = Test.find(params[:id])
  end


  def new
    @test = Test.new
    #script = @test.scripts.build
    #script_theme = script.script_themes.build
    #script_theme.script_sub_themes.build
  end


  def edit
    @test = Test.find(params[:id])
  end


  def create
    @test = Test.new(params[:test])
    #script = @test.scripts.build
    #(params[:test][:scripts_attributes]["0"])
    #script_theme = script.script_themes.build
    #script_theme.script_sub_themes.build

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, :notice => 'Тест успешно создан.' }
        format.json { render :json => @test, :status => :created, :location => @test }
      else
        format.html { render :action => "new" }
        format.json { render :json => @test.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @test = Test.find(params[:id])

    respond_to do |format|
      if @test.update_attributes(params[:test])
        format.html { redirect_to @test, :notice => 'Тест успешно отредактирован.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @test.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @test = Test.find(params[:id])
    @test.destroy

    respond_to do |format|
      format.html { redirect_to tests_url }
      format.json { head :ok }
    end
  end
end
