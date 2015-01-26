class GithubUser
  attr_reader :avatar_url

  def initialize(username, data)
    @data = data
    parse(username)
  end

  private

  def parse(username)
    @data.each do |event|
      if event['actor']['login'].downcase == username.downcase
        @avatar_url = event['actor']['avatar_url']
        break
      end
    end
  end
end
