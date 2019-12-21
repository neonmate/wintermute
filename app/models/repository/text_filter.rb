class Repository::TextFilter

  include Minidusen::Filter

  filter :text do |scope, phrases|
    columns = [:name, :owner, :description]
    scope.where_like(columns => phrases)
  end

  filter :text do |scope, phrases|
    columns = [:name, :owner, :description]
    scope
      .where_like(columns => phrases)
      .or(scope.where(id: Message.where(parent_type: 'Repository').filtered(phrases.join(' ')).pluck(:parent_id)))
  end

end
