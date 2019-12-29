module DoesFindByAnything

  as_trait do

    define_singleton_method(:find_by_anything) do |identifier|
      matchable_columns = columns.reject { |column| [:binary, :boolean].include?(column.type) }

      query_clauses = matchable_columns.map do |column|
        "CAST(#{table_name}.#{column.name} AS TEXT) = ?"
      end

      bindings = [identifier] * query_clauses.size
      where([query_clauses.join(' OR '), *bindings]).first
    end

    define_singleton_method(:find_by_anything!) do |identifier|
      find_by_anything(identifier) || raise(
        ActiveRecord::RecordNotFound,
        "No column equals #{identifier.inspect}"
      )
    end

  end

end
