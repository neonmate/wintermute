module ApplicationHelper

  def no_records_available(&block)
    content_tag(:div, class: 'card mt-5') do
      if params[:query].present?
        content_tag(:div, class: 'card-body') do
          content_tag(:span, "No matching results for \"#{params[:query]}\"", class: 'text-muted')
        end
      else
        content_tag(:div, class: 'card-body', &block)
      end
    end
  end

  def ndash
    '–'
  end

  def bullet
    ' • '
  end

  def external_link_to(name, url, options = {})
    link_to(name, url, options.reverse_merge(target: '_blank', rel: 'noopener'))
  end

  def format_date(time_or_date)
    return ndash if time_or_date.blank?

    date = time_or_date.to_date if time_or_date.respond_to?(:to_date)
    l(date)
  end

  def format_string(string)
    string.presence || ndash
  end

  def format_text(text)
    return ndash if text.blank?

    safe_text = h(text)
    paragraphs = split_paragraphs(safe_text).map(&:html_safe)

    html = ''.html_safe
    paragraphs.each do |paragraph|
      html << content_tag(:p, paragraph)
    end
    html
  end

  def format_markdown(text)
    return ndash if text.blank?

    Markdown.new(text).to_html
  end

  def humanized_state(state)
    I18n.t(state, scope: 'assignable_values.state')
  end

end
