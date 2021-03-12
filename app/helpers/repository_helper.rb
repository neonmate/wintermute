module RepositoryHelper

  def repository_preview_image_alternative_text(repository)
    if repository.new_record?
      'Preview of the website for the new repository'
    else
      "Preview of the website for #{repository.name}"
    end
  end

end
