class Markdown

  # This is a reduced set of Sanitize::Config::RELAXED:
  # * In general we are not sure what Kramdown returns, so we allow as many elements as possible
  # * For the attributes and protocols we are as restrictive as possible
  SANITIZE_WHITELIST = {
    elements: [
      'b',
      'em',
      'i',
      'strong',
      'u',
      'a',
      'abbr',
      'blockquote',
      'br',
      'cite',
      'code',
      'dd',
      'dfn',
      'dl',
      'dt',
      'kbd',
      'li',
      'mark',
      'ol',
      'p',
      'pre',
      'q',
      's',
      'samp',
      'small',
      'strike',
      'sub',
      'sup',
      'time',
      'ul',
      'var',
      'address',
      'article',
      'aside',
      'bdi',
      'bdo',
      'body',
      'caption',
      'col',
      'colgroup',
      'data',
      'del',
      'div',
      'figcaption',
      'figure',
      'footer',
      'h1',
      'h2',
      'h3',
      'h4',
      'h5',
      'h6',
      'head',
      'header',
      'hgroup',
      'hr',
      'html',
      'img',
      'ins',
      'main',
      'nav',
      'rp',
      'rt',
      'ruby',
      'section',
      'span',
      'style',
      'summary',
      'sup',
      'table',
      'tbody',
      'td',
      'tfoot',
      'th',
      'thead',
      'title',
      'tr',
      'wbr',
    ],
    attributes: {
      all: [
        'hidden',
        'title',
        'translate',
      ],
      'a' => [
        'href',
        'hreflang',
        'name',
        'rel',
      ],
      'blockquote' => [
        'cite',
      ],
      'q' => [
        'cite',
      ],
      'time' => [
        'datetime',
        'pubdate',
      ],
      'col' => [
        'span',
        'width',
      ],
      'colgroup' => [
        'span',
        'width',
      ],
      'del' => [
        'cite',
        'datetime',
      ],
      'img' => [
        'align',
        'alt',
        'border',
        'height',
        'src',
        'width',
      ],
      'ins' => [
        'cite',
        'datetime',
      ],
      'li' => [
        'value',
      ],
      'ol' => [
        'reversed',
        'start',
        'type',
      ],
      'table' => [
        'align',
        'border',
        'cellpadding',
        'cellspacing',
        'frame',
        'rules',
        'sortable',
        'summary',
        'width',
      ],
      'td' => [
        'abbr',
        'align',
        'axis',
        'colspan',
        'headers',
        'rowspan',
        'valign',
        'width',
      ],
      'th' => [
        'abbr',
        'align',
        'axis',
        'colspan',
        'headers',
        'rowspan',
        'scope',
        'sorted',
        'valign',
        'width',
      ],
      'ul' => [
        'type',
      ],
    },
    protocols: {
      'a' => {
        'href' => ['ftp', 'http', 'https', 'mailto', :relative],
      },
      'blockquote' => {
        'cite' => ['http', 'https', :relative],
      },
      'q' => {
        'cite' => ['http', 'https', :relative],
      },
      'del' => {
        'cite' => ['http', 'https', :relative],
      },
      'img' => {
        'src' => ['http', 'https', :relative],
      },
      'ins' => {
        'cite' => ['http', 'https', :relative],
      },
    },
    add_attributes: {
      'a' => {
        'rel' => 'nofollow',
      },
    },
  }.freeze

  attr_accessor :text

  def initialize(text)
    self.text = text
  end

  def to_html
    html = Kramdown::Document.new(text).to_html
    sanitize(html)
  end

  private

  def sanitize(html)
    Sanitize.fragment(html, SANITIZE_WHITELIST).html_safe
  end

end
