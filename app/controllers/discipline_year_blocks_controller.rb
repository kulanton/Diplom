class DisciplineYearBlocksController < ApplicationController
  # GET /discipline_year_blocks
  # GET /discipline_year_blocks.json
  def index
    @discipline_year_blocks = DisciplineYearBlock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @discipline_year_blocks }
    end
  end

  # GET /discipline_year_blocks/1
  # GET /discipline_year_blocks/1.json
  def show
    @discipline_year_block = DisciplineYearBlock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @discipline_year_block }
    end
  end

  # GET /discipline_year_blocks/new
  # GET /discipline_year_blocks/new.json
  def new
    @discipline_year_block = DisciplineYearBlock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @discipline_year_block }
    end
  end

  # GET /discipline_year_blocks/1/edit
  def edit
    @discipline_year_block = DisciplineYearBlock.find(params[:id])
  end

  # POST /discipline_year_blocks
  # POST /discipline_year_blocks.json
  def create
    @discipline_year_block = DisciplineYearBlock.new(params[:discipline_year_block])

    respond_to do |format|
      if @discipline_year_block.save
        format.html { redirect_to @discipline_year_block, :notice => 'Discipline year block was successfully created.' }
        format.json { render :json => @discipline_year_block, :status => :created, :location => @discipline_year_block }
      else
        format.html { render :action => "new" }
        format.json { render :json => @discipline_year_block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /discipline_year_blocks/1
  # PUT /discipline_year_blocks/1.json
  def update
    @discipline_year_block = DisciplineYearBlock.find(params[:id])

    respond_to do |format|
      if @discipline_year_block.update_attributes(params[:discipline_year_block])
        format.html { redirect_to @discipline_year_block, :notice => 'Discipline year block was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @discipline_year_block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /discipline_year_blocks/1
  # DELETE /discipline_year_blocks/1.json
  def destroy
    @discipline_year_block = DisciplineYearBlock.find(params[:id])
    @discipline_year_block.destroy

    respond_to do |format|
      format.html { redirect_to discipline_year_blocks_url }
      format.json { head :ok }
    end
  end
end
