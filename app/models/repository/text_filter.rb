class Repository::TextFilter

  include Minidusen::Filter

  filter :text do |scope, phrases|
    columns = [:name, :owner, :description]
    scope.where_like(columns => phrases)
  end

end
