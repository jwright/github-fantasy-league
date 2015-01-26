require 'httparty'

module Github
  class Event
    include HTTParty
    base_uri 'https://api.github.com'

    def initialize(username)
      @username = username
    end

    def get
      self.class.get "/users/#{@username}/events",
        headers: { "User-Agent" => "jwright" }
    end
  end
end
