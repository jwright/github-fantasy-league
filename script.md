GitHub Fantasy League
=====================

1. [Create the project in .NET](#dotnet-createproject)
1. [Create the project in Rails](#rails-createproject)
1. [Create the feature in .NET](#dotnet-createfeature)
1. [Create the feature in Rails](#rails-createfeature)
1. [Implement steps in .NET](#dotnet-implementsteps)
1. [Implement steps in Rails](#rails-implementsteps)
1. [Spec User in .NET](#dotnet-specuser)
1. [Spec User in Rails](#rails-specuser)
1. [Spec GitHubScorer in .NET](#dotnet-specscorer)
1. [Spec GitHubScorer in Rails](#rails-specscorer)
1. [Implement GitHub API Wrapper in .NET](#dotnet-api)
1. [Implement GitHub API Wrapper in Rails](#rails-api)
1. [Implement VCR in Rails](#rails-vcr)
1. [Implement Controller in .NET](#dotnet-controller)
1. [Implement Controller in Rails](#rails-controller)

Git
----

To remove the current working unstaged files:

```sh
git clean -df & git checkout -- .
```

.NET
----

### Create the Project<a id="dotnet-createproject"></a>

* Create a blank solution in Visual Studio 2010 (save in /SOURCE/ghfl)
* Create a Visual Studio Web MVC project and add to solution and call it GitHubFantasyLeague
* Remove jquery.ui, Microsoft Ajax, css/themes

### Create the Feature<a id="dotnet-createfeature"></a>

* GoTo Tools -> Extension Manager (show that SpecFlow is installed)
* Add a Class Library project called GitHubFantasyLeague.Specs
* Open up Package Manager Console
* Install-Package SpecFlow.NUnit -ProjectName GitHubFantasyLeague.Spec
* Delete Class.cs
* Add a Specflow feature file called DisplayTotalScore.feature

```
Feature: Display total score
  As a unauthorized user
  I should be able to view the total score for a Github user
  In order to compare Github users

  Scenario: Entering a valid Github username
    Given I have a valid Github username
    And I am on the home page
    When I enter the Github username
    Then I should see the total score
```

* Add StepDefinitions folder to the project
* Add Support folder to the project
* Right-click on feature file and Generate steps for GitHubSteps (copy to clipboard)
* Right-click on feature file and Generate steps for NavigationSteps (copy to clipboard)
* Right-click on project and run tests

### Implement the Steps<a id="dotnet-implementsteps"></a>

* Created Engine
* Added RestfulRouting

### Spec User<a id="dotnet-specuser"></a>

* Added project for GitHubFantasyLeague.Tests
* Added NSpec
* Added UserSpec
* Added project for GitHubFantasyLeague.Models

To run the specs, you can use NSpecRunner

```
> NSpecRunner.exe GitHubFantasyLeague.Tests/bin/debug/GitHubFantasyLeague.Tests.dll
```

### Spec GitHubScorer<a id="dotnet-specscorer"></a>

* Added GitHubScorer
* Added GitHubScorerSpec
* Updated code in User

### Implement API Wrapper<a id="dotnet-api"></a>

* Create GitHub class
* Install RestSharp
* Install NewtonSoft JSON parser

### Implement Controller<a id="dotnet-controller"></a>

* Added Users routes
* Added UsersController
* Added new view

Rails
-----

### Create the Project<a id="rails-createproject"></a>

Since we already have a `github-fantasy-league` directory due to what we have already done, let's create a ghfl directory and then
come back to it.

```sh
rails new github-fantasy-league2 --skip-bundle
cd github-fantasy-league2
rm public/index.html
rm app/assets/images/rails.png
l app
```

### Create the Feature<a id="rails-createfeature"></a>

```ruby
# Gemfile

group :test do
  gem 'cucumber-rails'
  gem 'database_cleaner'
end
```

```sh
bundle install
rails g cucumber:install
```

```ruby
# features/display_total_score.feature

Feature: Display total score
  As a unauthorized user
  I should be able to view the total score for a Github user
  In order to compare Github users

  Scenario: Entering a valid Github username
    Given I have a valid Github username
    And I am on the home page
    When I enter the Github username
    Then I should see the total score
```

```sh
be cucumber
```

```ruby
# features/step_definitions/github_steps.rb
# place step 1, 3, and 4
# features/step_definitions/navigation_steps.rb
# place step 2
```

### Implement the Steps<a id="rails-implementsteps"></a>

```ruby
# features/step_definitions/github_steps.rb

Given(/^I have a valid GitHub username$/) do
  @username = 'tenderlove'
end

# features/step_definitions/navigation_steps.rb

Given(/^I am on the home page$/) do
  visit '/'
end
```

```sh
be cucumber
```

```ruby
# config/routes.rb

root :to => 'home#index'
```

```ruby
# app/controllers/home_controller.rb

class HomeController < ApplicationController
 def index
 end
end
```

```ruby
# Gemfile

gem 'haml-rails'
```

```ruby
# app/views/home/index.html.haml
```

```ruby
# features/step_definitions/github_steps.rb

When(/^I enter the GitHub username$/) do
  fill_in 'Username', with: @username
  click_link 'Get scores'
end
```

```ruby
# app/views/home/index.html.haml

.field
  %label{ for: 'username' } Username
  %input{ type: 'text', id: 'username', name: 'username'}
.actions
  %a{ href: '#', class: 'score-trigger' } Get scores
```

```ruby
# features/step_definitions/github_steps.rb

Then(/^I should see the total score$/) do
  total_score = User.find(@username).calculate.total_score
  within '#total-score' do
    page.should have_content total_score
  end
end
```

### Spec User<a id="rails-specuser"></a>

```ruby
# Gemfile

group :test do
  gem 'rspec-rails'
end
```

```sh
bundle install
rails g rspec:install
```

```ruby
# spec/models/user_spec.rb

require_relative '../../app/models/user'

describe User do
  describe '.find' do
    it 'should return a new instance'
  end

  describe '.calculate' do
    it 'should enable chaining'
    it 'should populate the total score'
  end
end
```

```ruby
# app/models/user.rb

class User
end
```

```ruby
# spec/models/user_spec.rb

describe '.find' do
  it 'should return a new instance' do
    User.find('wycats').username.should == 'wycats'
  end
end
```

```ruby
# app/models/user.rb

class User
  attr_reader :username

  def self.find(username)
    User.new(username)
  end

  private

  def initialize(username)
    @username = username
  end
end
```

```ruby
# spec/models/user_spec.rb

describe '.calculate' do
  subject { User.find('topfunky') }

  it 'should enable chaining' do
    subject.calculate.should be_a User
  end
end

# app/models/user.rb

class User
...
  def calculate
    self
  end
...
end
```

```ruby
# spec/models/user_spec.rb

it 'should populate the total score' do
  subject.calculate.total_score.should_not be_nil
end

# app/models/user.rb

attr_reader :total_score

def calculate
  @total_score = 0
end
```

### Spec GitHubScorer<a id="rails-specscorer"></a>

```sh
cd ..
curl https://github.com/tenderlove.json > tenderlove.json
cat tenderlove.json | prettify_json.rb
```

```ruby
# app/models/user.rb

def calculate
  @scorer = GithubScorer.new(data)
  @total_score = @scorer.score.total_score
  self
end
```

```ruby
# spec/models/github_scorer_spec.rb

require_relative '../../app/models/github_scorer'

describe GithubScorer do
  describe '#score' do
    it 'should parse events'
    it 'should calculate the total score'
  end
end
```

```ruby
# app/models/github_scorer.rb

class GithubScorer
end
```

```ruby

require 'json'
require_relative '../../app/models/github_scorer'

describe GithubScorer do
  describe '#score' do
    let(:data) {
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
    }

    subject { GithubScorer.new(data) }

    it 'should parse events' do
      subject.score.events.count.should == 8
    end

    it 'should calculate the total score'
  end
end
```

```ruby
# app/models/github_scorer.rb

class GithubScorer
  attr_reader :events

  def initialize(data)
    @data = data
    parse
  end

  def score
    self
  end

  private

  def parse
    @events = []
    @data.each do |event|
      @events << event['type']
    end
  end
end
```

```ruby
# spec/models/github_scorer_spec.rb

it 'should calculate the total score' do
  subject.score.total_score.should == 24
end
```

```ruby
# app/models/github_scorer_spec.rb

class GithubScorer
  attr_reader :events, :total_score

  def initialize(data)
    @data = data
    @total_score = 0
    parse
  end

  def score
    @events.each do |event|
      @total_score += case event
        when 'CommitCommentEvent' then 2
        when 'IssueCommentEvent' then 2
        when 'IssuesEvent' then 3
        when 'WatchEvent' then 1
        when 'PullRequestEvent' then 5
        when 'PushEvent' then 7
        when 'FollowEvent' then 1
        when 'CreateEvent' then 3
        else 0
      end
    end

    self
  end

  private

  def parse
    @events = []
    @data.each do |event|
      @events << event['type']
    end
  end
end
```

### Implement API Wrapper<a id="rails-api"></a>

```ruby
# spec/models/user_spec.rb

require_relative '../../app/models/github_scorer'
```

```ruby
# Gemfile

gem 'httparty'
```

```ruby
# lib/github.rb

require github/event
```

```sh
mkdir lib/github
```

```ruby
# lib/github/event.rb

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
```

```ruby
# app/models/user.rb

require_relative '../../lib/github'

class User
  attr_reader :username, :total_score

  def self.find(username)
    User.new(username)
  end

  def calculate
    @total_score = scorer.total_score
    self
  end

  private

  def initialize(username)
    @username = username
  end

  def scorer
    unless @scorer
      data = Github::Event.new(@username).get
      @scorer = GithubScorer.new(data).score
    end
    @scorer
  end
end
```

### Implement VCR<a id="rails-vcr"></a>

```ruby
# Gemfile

group :development do
  gem 'fakeweb'
  gem 'vcr'
end
```

```ruby
# spec/spec_helper.rb

require 'vcr'

RSpec.configure do |config|
...
  config.extend VCR::RSpec::Macros
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :fakeweb
  c.default_cassette_options = { :record => :new_episodes }
end
```

```ruby
# spec/models/user_spec.rb

require 'spec_helper'

describe '.calculate' do
  use_vcr_cassette 'topfunky'
...
end
```

### Implement Controller<a id="rails-controller"></a>

```ruby
# app/views/home/index.html.haml

= form_tag users_path do
...
  %button{ type: 'submit', class: 'score-trigger' } Get scores
```

```ruby
# config/routes.rb

resources :users, only: :create
```

```ruby
# features/step_definitions/github_steps.rb

...
click_button 'Get scores'
...
```

```ruby
# app/controllers/users_controller

class UsersController < ApplicationController
  def create
    render :new
  end
end
```

```sh
mkdir app/views/users
```

```ruby
# app/views/users/new.html.haml

#scores
  .total
    Total score:
    %span#total-score= @total_score
```

```ruby
# app/controllers/users_controller.rb

@total_score = User.find(params[:username]).calculate.total_score
```
