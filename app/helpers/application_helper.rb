module ApplicationHelper
  def current_study_year
    current_year = Time.now.year.to_i
    current_year.to_s + "/" + (current_year-1).to_s
  end
end
