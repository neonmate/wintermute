require 'graphql/client'
require 'graphql/client/http'

module Github

  SCHEMA_PATH = File.join(Rails.root, 'config', 'graphql', 'github_schema.json').freeze

  HTTP = GraphQL::Client::HTTP.new('https://api.github.com/graphql') do
    def headers(_context)
      {
        'Authorization' => "Bearer #{Rails.application.secrets.github_personal_access_token}"
      }
    end
  end

  Schema = GraphQL::Client.load_schema(SCHEMA_PATH)

  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)

  module_function

  # We want to prevent a request on each Rails boot. It might be necessary to refresh the schema from time to time.
  #
  # Github.refresh_schema
  #
  # https://developer.github.com/v4/breaking_changes/
  def refresh_schema
    GraphQL::Client.dump_schema(HTTP, SCHEMA_PATH)
  end

end
