module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? "btn btn-defalut active" : "hidden"
  end
end
