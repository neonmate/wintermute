class Project::TextFilter

  include Minidusen::Filter

  filter :text do |scope, phrases|
    columns = [:title, :subtitle]
    scope.where_like(columns => phrases)
  end

end
