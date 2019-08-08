class Conversation::TextFilter

  include Minidusen::Filter

  filter :text do |scope, phrases|
    columns = [:title, :body]
    scope
      .where_like(columns => phrases)
      .or(scope.where(id: Message.filtered(phrases.join(' ')).pluck(:conversation_id)))
  end

end
