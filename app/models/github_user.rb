class GithubUser
  attr_reader :avatar_url

  def initialize(username, data)
    @data = data
    parse(username)
  end

  private

  def parse(username)
    @data.each do |event|
      if event['actor'] == username
        gravatar = event['actor_attributes']['gravatar_id']
        @avatar_url = "http://gravatar.com/avatar/#{gravatar}"
      end
      break
    end
  end
end
