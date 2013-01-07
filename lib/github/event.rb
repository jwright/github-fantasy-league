require 'httparty'

module Github
  class Event
    include HTTParty
    base_uri 'https://github.com'

    def initialize(username)
      @username = username
    end

    def get
      self.class.get "/#{@username}.json"
    end
  end
end
