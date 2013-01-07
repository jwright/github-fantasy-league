class GithubScorer
  attr_reader :events, :total_score

  def initialize(data)
    @data = data
    parse
  end

  def score
    @total_score = 0
    @events.each do |event|
      @total_score += case event
        when 'CommitCommentEvent' then 2
        when 'IssueCommentEvent' then 2
        when 'IssuesEvent' then 3
        when 'WatchEvent' then 1
        when 'PullRequestEvent' then 5
        when 'PushEvent' then 7
        when 'FollowEvent' then 1
        when 'CreateEvent' then 3
        else 0
      end
    end

    self
  end

  private

  def parse
    @events = []
    @data.each do |event|
      @events << event['type']
    end
  end
end
