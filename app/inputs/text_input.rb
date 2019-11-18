class TextInput < SimpleForm::Inputs::TextInput
  def input(*)
    input_html_options.reverse_merge!(rows: 10)

    super
  end
end
