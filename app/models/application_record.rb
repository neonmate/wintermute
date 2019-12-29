class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  if Rails.env.test? || Rails.env.development?
    include DoesFindByAnything
  end
end
