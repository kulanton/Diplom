class TestsController < ApplicationController

  def index
    @tests = Test.all
  end


  def show
    @test = Test.find(params[:id])
  end


  def new
    @test = Test.new
    if params[:block]
      @test.block_ids << params[:block]
    end
  end


  def edit
    @test = Test.find(params[:id])
  end


  def create
    @test = Test.new(params[:test])

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
