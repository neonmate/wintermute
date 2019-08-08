class Message::TextFilter

  include Minidusen::Filter

  filter :text do |scope, phrases|
    columns = [:body]
    scope.where_like(columns => phrases)
  end

end
