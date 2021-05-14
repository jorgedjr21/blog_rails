module HeaderHelper
  def blog_categories
    categories = Post::CATEGORIES.map do |category|
      "<a href='#' class='p-2 text-muted'>#{category}</a>"
    end

    categories
  end
end
