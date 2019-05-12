class Project::Synchronizer

  REPOSITORY_URL_SPLIT_PATTERN = %r{https://github\.com/(?<owner>\S+)/(?<name>\S+)}.freeze

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
              history(first: 25) {
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
    Project.find_each do |project|
      new(project).synchronize_repository
    end
  end

  def initialize(project)
    self.project = project
  end

  def synchronize_repository
    result = Github::Client.query(
      REPOSITORY_META_QUERY,
      variables: { owner: repository[:owner], name: repository[:name] }
    )
    repository = result.data.repository

    return if repository.blank?

    project.update!(
      repository_stats: {
        description: repository.description,
        created_at: repository.created_at,
        homepage_url: repository.homepage_url,
        total_stars: repository.stargazers&.total_count,
        total_watchers: repository.watchers&.total_count,
        total_issues: repository.issues&.total_count,
        languages: repository.languages&.nodes&.map(&:name) || [],
        last_commits: repository.ref&.target&.history&.edges&.map { |edge| edge.node&.committed_date } || [],
        licence: repository.license_info&.name,
        last_synchronized_at: Time.now,
      }
    )
  end

  private

  def repository
    @repository ||= project.repository_url.match(REPOSITORY_URL_SPLIT_PATTERN)
  end

  attr_accessor :project

end
