Feature: Display total score
  As an unauthorized user
  I should be able to view the total score for a Github username
  In order to compare Github users

  Scenario: Entering a valid Github username
    Given I have a valid Github username
    And I am on the home page
    When I enter the Github username
    Then I should see the total score
