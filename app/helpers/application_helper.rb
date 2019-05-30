module ApplicationHelper

  def no_records_available(&block)
    content_tag(:div, class: 'card mt-5') do
      content_tag(:div, class: 'card-body', &block)
    end
  end

  def ndash
    '–'
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

end
