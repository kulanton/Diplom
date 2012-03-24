class SubjectsController < ApplicationController
  def index
    @subjects = Subject.includes(:discipline, :group).where("lower(disciplines.name) LIKE lower(?) OR lower(groups.name) LIKE lower(?) OR lower(year) LIKE lower(?)", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    
    respond_to do |format|
      format.json do
        render :json => @subjects.map(&:attributes)
      end
    end
  end

end
