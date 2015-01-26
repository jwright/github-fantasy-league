require 'httparty'

module Github
  class Event
    include HTTParty
    base_uri 'https://api.github.com'

    def initialize(username)
      @username = username
    end

    def get
      self.class.get "/users/#{@username}/events"
    end
  end
end
