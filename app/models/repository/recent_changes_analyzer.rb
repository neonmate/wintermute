class Repository::RecentChangesAnalyzer

  THRESHOLD_FOR_DAYS = 1
  THRESHOLD_FOR_WEEKS = 7
  THRESHOLD_FOR_MONTHS = 30
  THRESHOLD_FOR_YEARS = 365

  attr_accessor :last_commits_at

  def initialize(repository)
    self.last_commits_at = repository.last_commits_at
  end

  def count_commits_for_the_last_day
    if commit_distance >= THRESHOLD_FOR_DAYS
      "#{counter[:day]} commits within the last day."
    else
      "More than #{counter[:day]} commits within the last day."
    end
  end

  def count_commits_for_the_last_week
    if commit_distance >= THRESHOLD_FOR_WEEKS
      "#{counter[:week]} commits within the last week."
    else
      "More than #{counter[:week]} commits within the last week."
    end
  end

  def count_commits_for_the_last_month
    if commit_distance >= THRESHOLD_FOR_MONTHS
      "#{counter[:month]} commits within the last month."
    else
      "More than #{counter[:month]} commits within the last month."
    end
  end

  def count_commits_for_the_last_year
    if commit_distance >= THRESHOLD_FOR_YEARS
      "#{counter[:year]} commits within the last year."
    else
      "More than #{counter[:year]} commits within the last year."
    end
  end

  private

  def counter
    @counter ||= begin
      counter = {
        day: 0,
        week: 0,
        month: 0,
        year: 0,
      }

      last_commits_at.each do |last_commit_at|
        days_passed = (Date.today - last_commit_at.to_date).to_i

        counter[:day] += 1 if days_passed < THRESHOLD_FOR_DAYS
        counter[:week] += 1 if days_passed < THRESHOLD_FOR_WEEKS
        counter[:month] += 1 if days_passed < THRESHOLD_FOR_MONTHS
        counter[:year] += 1 if days_passed < THRESHOLD_FOR_YEARS
      end

      counter
    end
  end

  # We only store the latest 100 commits, so we need to predict if there might be more commits
  def commit_distance
    @earliest_commit ||= (Date.today - last_commits_at.min.to_date).to_i
  end

end
