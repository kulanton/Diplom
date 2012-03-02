class DisciplinesController < ApplicationController

  def index
    @disciplines = Discipline.all.sort_by(&:name)

    respond_to do |format|
      format.html
      format.json do
        @disciplines = Discipline.where("lower(name) LIKE lower(?)","%#{params[:q]}%").all
        render :json => @disciplines.map(&:attributes)
      end
    end
  end


  def show
    @discipline = Discipline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @discipline }
    end
  end


  def new
    @discipline = Discipline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @discipline }
    end
  end

  # GET /disciplines/1/edit
  def edit
    @discipline = Discipline.find(params[:id])
  end

  # POST /disciplines
  # POST /disciplines.json
  def create
    @discipline = Discipline.new(params[:discipline])

    respond_to do |format|
      if @discipline.save
        format.html { redirect_to @discipline, :notice => 'Дисциплина успешно создана.' }
        format.json { render :json => @discipline, :status => :created, :location => @discipline }
      else
        format.html { render :action => "new" }
        format.json { render :json => @discipline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /disciplines/1
  # PUT /disciplines/1.json
  def update
    @discipline = Discipline.find(params[:id])

    respond_to do |format|
      if @discipline.update_attributes(params[:discipline])
        format.html { redirect_to @discipline, :notice => 'Дисциплина успешно отредактирована.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @discipline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    @discipline = Discipline.find(params[:id])
    @discipline.destroy

    respond_to do |format|
      format.html { redirect_to disciplines_url }
      format.json { head :ok }
    end
  end
end
