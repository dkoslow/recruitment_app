module SearchHelper

  def text_search(query, *fields)
    if query.present?
      results = []
      fields.each do |field|
        result = where("#{field} @@ :q", q: query)
        results += result
      end
      return results.uniq
    else
      scoped
    end
  end
end