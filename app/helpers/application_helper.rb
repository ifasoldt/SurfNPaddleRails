module ApplicationHelper
  def set_background
    if @post && (1..5).to_a.include?(@post.id)
      "header-banner#{@post.id}"
    else
      "header-banner0"
    end
  end
end
