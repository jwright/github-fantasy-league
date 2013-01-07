require_relative '../../app/models/github_scorer'
require_relative '../../app/models/user'

describe User do
  describe 'find' do
    it 'should return a new instance' do
      User.find('wycats').username.should == 'wycats'
    end
  end

  describe 'calculate' do
    subject { User.find('topfunky') }
    it 'should enable chaining' do
      subject.calculate.should be_a User
    end

    it 'should populate the total score' do
      subject.calculate.total_score.should_not be_nil
    end
  end
end
