Feature: User can login into ActivityBaseProject website

Scenario: Login

  Given I am on the ActivityBaseProject login page
  When I fill in "Username" with "Someone"
  And I fill in "Password" with "1234"
  And I press "Login"
  Then I should be on the ActivityBaseProject home page