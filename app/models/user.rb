class User
  attr_reader :username
  attr_reader :total_score

  def self.find(username)
    User.new(username)
  end

  def calculate
    @total_score = 0
    self
  end

  private

  def initialize(username)
    @username = username
  end
end
