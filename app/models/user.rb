require_relative '../../lib/github'

class User
  attr_reader :username, :total_score, :avatar_url

  def self.find(username)
    User.new(username)
  end

  def calculate
    @total_score = scorer.total_score
    @avatar_url = GithubUser.new(@username, data).avatar_url
    self
  end

  private

  def initialize(username)
    @username = username
  end

  def scorer
    unless @scorer
      @scorer = GithubScorer.new(data).score
    end
    @scorer
  end

  def data
    unless @data
      @data = Github::Event.new(@username).get
    end
    @data
  end
end
