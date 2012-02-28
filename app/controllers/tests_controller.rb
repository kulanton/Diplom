class TestsController < ApplicationController
  # GET /tests
  # GET /tests.json
  def index
    if params[:discipline].nil? and params[:group].nil?
      @tests = Test.all
    elsif params[:discipline].nil?
      #dgs = DisciplinesGroups.where(:group_id => params[:group])
      #@tests = Test.includes(:disciplines_groups).where("disciplines_groups.group_id = ?", params[:group])
    elsif params[:group].nil?
      #dgs = DisciplinesGroups.where(:discipline_id => params[:discipline])
      #@tests = Test.where("disc_group_id in ?", dgs.ids)
    else
      #dgs = DisciplinesGroups.where(:discipline_id => params[:discipline], :group_id => params[:group])
      @tests = Test.includes(:disciplines_groups).where("disciplines_groups.discipline_id = ?", params[:discipline])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tests }
    end
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    @test = Test.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @test }
    end
  end

  # GET /tests/new
  # GET /tests/new.json
  def new
    @test = Test.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @test }
    end
  end

  # GET /tests/1/edit
  def edit
    @test = Test.find(params[:id])
  end

  # POST /tests
  # POST /tests.json
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

  # PUT /tests/1
  # PUT /tests/1.json
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

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test = Test.find(params[:id])
    @test.destroy

    respond_to do |format|
      format.html { redirect_to tests_url }
      format.json { head :ok }
    end
  end
end
