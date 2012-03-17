class DisciplinesGroupsController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        @disciplines_groups = DisciplinesGroups.includes(:discipline, :group).where("lower(disciplines.name) LIKE lower(?) OR groups.name LIKE ? OR groups.year LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%").all
        render :json => @disciplines_groups.map(&:attributes)
      end
    end
  end

end
