describe MessagesController do

  it { is_expected.to check_power(crud: :messages, as: :message_scope) }

end
