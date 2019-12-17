module HtmlSelectorsHelpers
  # Maps a name to a selector. Used primarily by the
  #
  #   When /^(.+) within (.+)$/ do |step, scope|
  #
  # step definitions in web_steps.rb
  #
  def selector_for(locator)
    case locator

    # Usage example:
    #   the "Tables" section -> 'section[aria-label="Tables"]'
    when /^the "(.*?)" section$/
      %(section[aria-label="#{Regexp.last_match(1)}"])

    when /^the modal$/
      '.up-modal'

    # Auto-mapper for BEM classes
    #
    # Usage examples:
    #   the main menu -> '.main-menu'
    #   the item box's header -> '.item-box--header'
    #   the slider's item (current) -> '.slider--item.-current'
    when /^the (.+?)(?:'s (.+?))?(?: \((.+)\))?$/
      selector = '.'
      selector << selectorify(Regexp.last_match(1))
      selector << '--' << selectorify(Regexp.last_match(2)) if Regexp.last_match(2)
      selector << '.-' << selectorify(Regexp.last_match(3)) if Regexp.last_match(3)
      selector

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #  when /^the (notice|error|info) flash$/
    #    ".flash.#{$1}"

    # You can also return an array to use a different selector
    # type, like:
    #
    #  when /the header/
    #    [:xpath, "//header"]

    # This allows you to provide a quoted selector as the scope
    # for "within" steps as was previously the default for the
    # web steps:
    when /^"(.+)"$/
      Regexp.last_match(1)

    else
      raise(<<~TEXT)
        Can't find mapping from "#{locator}" to a selector.
        Now, go and add a mapping in #{__FILE__}
      TEXT
    end
  end

  private

  def selectorify(string)
    string.gsub(/ /, '-')
  end

end

World(HtmlSelectorsHelpers)
