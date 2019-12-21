class Idea::TextFilter

  include Minidusen::Filter

  filter :text do |scope, phrases|
    columns = [:title, :body]
    scope
      .where_like(columns => phrases)
      .or(scope.where(id: Message.where(parent_type: 'Idea').filtered(phrases.join(' ')).pluck(:parent_id)))
  end

end
