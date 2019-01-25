module NavigationHelpers

  def path_to(page_name)
    case page_name

    when 'the homepage'
      root_path

    when /^the list of (.*?)$/
      models_prose = Regexp.last_match(1)
      route = "#{model_prose_to_route_segment(models_prose)}_path"
      send(route)

    when /^the (page|form) for the (.*?) above$/
      action_prose = Regexp.last_match(1)
      model_prose = Regexp.last_match(2)
      route = "#{(action_prose == 'form') ? 'edit_' : ''}#{model_prose_to_route_segment(model_prose)}_path"
      model = model_prose_to_class(model_prose)
      send(route, model.reorder(:id).last!)

    when /^the (page|form) for the (.*?) "(.*?)"$/
      action_prose = Regexp.last_match(1)
      model_prose = Regexp.last_match(2)
      identifier = Regexp.last_match(3)
      path_to_show_or_edit(action_prose, model_prose, identifier)

    when /^the (.*?) (page|form) for "(.*?)"$/
      model_prose = Regexp.last_match(1)
      action_prose = Regexp.last_match(2)
      identifier = Regexp.last_match(3)
      path_to_show_or_edit(action_prose, model_prose, identifier)

    when /^the (.*?) form$/
      model_prose = Regexp.last_match(1)
      route = "new_#{model_prose_to_route_segment(model_prose)}_path"
      send(route)

    when /"(.+?)"$/
      Regexp.last_match(1)

    end
  end

  private

  def path_to_show_or_edit(action_prose, model_prose, identifier)
    model = model_prose_to_class(model_prose)
    route = "#{(action_prose == 'form') ? 'edit_' : ''}#{model_prose_to_route_segment(model_prose)}_path"
    send(route, model.find_by_anything!(identifier))
  end

  def model_prose_to_class(model_prose)
    model_prose.gsub(' ', '_').classify.constantize
  end

  def model_prose_to_route_segment(model_prose)
    model_prose = model_prose.downcase
    model_prose.gsub(/[\ \/]/, '_')
  end

end

World(NavigationHelpers)
