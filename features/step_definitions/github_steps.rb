Given /^I have a valid Github username$/ do
  @username = 'tenderlove'
end

Given /^I have an invalid Github username$/ do
  @username = 'fdlkdjlksf'
end

When /^I enter the Github username$/ do
  fill_in 'Username', :with => @username
  click_button 'Calculate score'
end

Then /^I should see the total score$/ do
  total_score = User.find(@username).calculate.total_score
  score = find(:xpath, "//input[@id='score']")
  score.value.should == total_score.to_s
end

Then /^I should see 'User not found.'$/ do
  page.should have_content 'User not found.'
end

Then /^I should see my Github avatar$/ do
  avatar_url = User.find(@username).calculate.avatar_url
  within '#user' do
    page.should have_xpath "//img[@src=\"#{avatar_url}?s=130\"]"
  end
end
