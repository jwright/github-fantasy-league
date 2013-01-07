Given /^I have a valid Github username$/ do
  @username = 'tenderlove'
end

When /^I enter the Github username$/ do
  fill_in 'Username', :with => @username
  click_button 'Get scores'
end

Then /^I should see the total score$/ do
  total_score = User.find(@username).calculate.total_score
  within '#total-score' do
    page.should have_content total_score
  end
end
