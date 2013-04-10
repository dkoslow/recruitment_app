module AutocompleteHelper

  def names_for(query)
    suggestions = where("lower(name) like ? OR lower(name) like ?", "#{query.downcase}%", "% #{query.downcase}%")
    suggestions.order("popularity desc").limit(10).pluck(:name).uniq
  end
end