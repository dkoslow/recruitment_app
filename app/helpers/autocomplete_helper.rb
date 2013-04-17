module AutocompleteHelper

  def names_for(query)
    suggestions = where("name ilike ? OR name ilike ?", "#{query}%", "% #{query}%")
    suggestions.order("popularity desc").limit(10).pluck(:name).uniq
  end
end