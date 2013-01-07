require_relative '../../lib/github'

class User
  attr_reader :username
  attr_reader :total_score

  def self.find(username)
    User.new(username)
  end

  def calculate
    @total_score = scorer.total_score
    self
  end

  private

  def initialize(username)
    @username = username
  end

  def scorer
    unless @scorer
      data = Github::Event.new(@username).get
      @scorer = GithubScorer.new(data).score
    end
    @scorer
  end
end
