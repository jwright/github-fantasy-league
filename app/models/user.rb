class User
  attr_reader :username
  attr_reader :total_score

  def self.find(username)
    User.new(username)
  end

  def calculate
    @scorer = GithubScorer.new(data)
    @total_score = @scorer.score.total_score
    self
  end

  private

  def initialize(username)
    @username = username
  end
end
