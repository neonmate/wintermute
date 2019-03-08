module CapybaraHelpers

  def expect_css(negate, selector, text)
    expectation = negate ? :not_to : :to
    expect(page).send(expectation, have_css(selector, text: text))
  end

end

World(CapybaraHelpers)
