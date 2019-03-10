module DoesTextFilter

  as_trait do |filter_class|

    define_singleton_method(:filtered) do |query|
      query.present? ? filter_class.new.filter(self, query) : all
    end

  end

end
