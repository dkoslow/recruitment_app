module AutocompleteHelper

  def names_for(query)
    suggestions = where("name like ?", "%#{query.downcase.titleize}%")
    suggestions.order("popularity desc").limit(10).pluck(:name)
  end

  def index_objects
    self.find_each do |object|
      index_name(object.name)
    end
  end

  def index_name(name)
    where(name: name.downcase).first_or_initialize.tap do |suggestion|
      suggestion.increment! :popularity
    end
  end
end