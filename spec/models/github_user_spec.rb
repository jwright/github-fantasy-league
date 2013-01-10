require_relative '../../app/models/github_user'
require 'json'

describe GithubUser do
  describe 'avatar_url' do
    let(:data) do
      JSON.parse('[{
        "actor" : "tenderlove",
        "actor_attributes": {
          "gravatar_id": "f29327647a9cff5c69618bae420792ea"
        }}]')
    end

    subject { GithubUser.new("tenderlove", data) }

    it 'should populate the avatar' do
      subject.avatar_url.should == "http://gravatar.com/avatar/f29327647a9cff5c69618bae420792ea"
    end
  end
end
