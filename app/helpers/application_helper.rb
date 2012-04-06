module ApplicationHelper
  def current_study_year
    current_year = Time.now.year.to_i
    current_year.to_s + "/" + (current_year-1).to_s
  end
  
  def title(page_title)
    content_for(:title) {page_title}
  end
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", :class => "btn btn-danger")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize, :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :class => "btn btn-success")
  end
  
  def results
    [["Темы", 1], ["Вопросы", 2], ["Детальный", 3]]
  end
end
