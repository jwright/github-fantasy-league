Feature: Display avatar
  As an unathorized user
  I should be able to view my Github avatar
  In order to verify that it is my account

  @javascript
  Scenario: Entering a valid Github username
    Given I have a valid Github username
    And I am on the home page
    When I enter the Github username
    Then I should see my Github avatar
