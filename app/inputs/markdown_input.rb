class MarkdownInput < TextInput
  def input(*)
    html = ''.html_safe

    html << content_tag(
      :small,
      template.external_link_to('Styling with Markdown is supported', template.markdown_help_path),
      class: 'markdown--help'
    )
    html << super

    html
  end
end
