class ExternalRepositoryReview::Importer

  LIMIT = 100
  SEARCH_QUERY = 'stars:>100 sort:stars'.freeze
  SEARCH_REPOSITORY_META_QUERY = Github::Client.parse <<-'GRAPHQL'
    query($query: String!, $limit: Int!, $after: String) {
      search(query: $query, type: REPOSITORY, first: $limit, after: $after) {
        pageInfo {
          startCursor
          endCursor
          hasNextPage
          hasPreviousPage
        }
        edges {
          node {
            ... on Repository {
              nameWithOwner
              homepageUrl
            }
          }
        }
      }
    }
  GRAPHQL

  attr_accessor :results

  def initialize
    self.results = []
  end

  def import_non_existing
    has_next_page = true
    after = nil

    while has_next_page
      result = search(after)

      result.data.search.edges.each do |repository|
        next if ExternalRepositoryReview.exists?(identifier: repository.node.name_with_owner)
        next if repository.node.homepage_url.blank?

        ExternalRepositoryReview.create!(
          identifier: repository.node.name_with_owner,
          homepage_url: repository.node.homepage_url,
        )
      end

      page_info = result.data.search.page_info
      after = page_info.end_cursor

      break unless page_info.has_next_page?
    end
  end

  private

  def search(after)
    Github::Client.query(
      SEARCH_REPOSITORY_META_QUERY,
      variables: { query: SEARCH_QUERY, limit: LIMIT, after: after }
    )
  end

end
