require_relative '../../app/models/github_scorer'
require 'json'

describe GithubScorer do
  describe 'score' do
    let(:data) do
      JSON.parse('[
        {"type":"CommitCommentEvent"},
        {"type":"IssuesEvent"},
        {"type":"IssueCommentEvent"},
        {"type":"WatchEvent"},
        {"type":"PullRequestEvent"},
        {"type":"PushEvent"},
        {"type":"FollowEvent"},
        {"type":"CreateEvent"}
      ]')
    end

    subject { GithubScorer.new(data) }

    it 'should parse events' do
      subject.score.events.count.should == 8
    end

    it 'should calculate the total score' do
      subject.score.total_score.should == 24
    end
  end
end
