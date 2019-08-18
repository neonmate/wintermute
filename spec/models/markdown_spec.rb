describe Markdown do

  it 'transforms markdown to HTML' do
    text = <<~TEXT
      ## Some header
      **Emphasized** and normal.
    TEXT

    expect(described_class.new(text).to_html).to eq(<<~HTML)
      <h2>Some header</h2>
      <p><strong>Emphasized</strong> and normal.</p>
    HTML
  end

  it 'sanitizes malicious HTML' do
    text = <<~TEXT
      <p class='some-class'>Some text</p>
      <a href='https://example.com'>Some link</a>
    TEXT

    expect(described_class.new(text).to_html).to eq(<<~HTML)
      <p>Some text</p>
      <p><a href="https://example.com" rel="nofollow">Some link</a></p>
    HTML
  end

end
