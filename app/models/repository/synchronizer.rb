class Repository::Synchronizer

  REPOSITORY_META_QUERY = Github::Client.parse <<-'GRAPHQL'
    query($owner: String!, $name: String!) {
      repository(owner: $owner, name: $name) {
        description
        createdAt
        homepageUrl
        stargazers {
          totalCount
        }
        watchers {
          totalCount
        }
        issues {
          totalCount
        }
        languages(first: 50) {
          nodes {
            name
          }
        }
        ref(qualifiedName: "master") {
          target {
            ... on Commit {
              history(first: 100) {
                edges {
                  node {
                    committedDate
                  }
                }
              }
            }
          }
        }
        licenseInfo {
          name
        }
      }
    }
  GRAPHQL

  def self.run
    Repository.find_each do |repository|
      new(repository).synchronize_repository
    end
  end

  def initialize(repository)
    self.repository = repository
  end

  def synchronize_repository
    raw_repository = fetch_result.data.repository

    if raw_repository.present?
      last_commits_at = raw_repository.ref&.target&.history&.edges&.map { |edge| edge.node&.committed_date } || []

      repository.update!(
        description: raw_repository.description,
        homepage_url: raw_repository.homepage_url,
        total_stars: raw_repository.stargazers&.total_count,
        total_watchers: raw_repository.watchers&.total_count,
        total_issues: raw_repository.issues&.total_count,
        first_commit_at: raw_repository.created_at,
        last_commit_at: last_commits_at.first,
        last_commits_at: last_commits_at,
        languages: raw_repository.languages&.nodes&.map(&:name) || [],
        licence: raw_repository.license_info&.name,
        last_synchronized_at: Time.now,
      )
    end
  end

  private

  def fetch_result
    Github::Client.query(
      REPOSITORY_META_QUERY,
      variables: { owner: repository.owner, name: repository.name }
    )
  end

  attr_accessor :repository

end
