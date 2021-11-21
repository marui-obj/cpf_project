Feature: User can login into ActivityBaseProject website

Background:
  Given I am on the ActivityBaseProject login page
  And the field 'username' is empty
  And the field 'password' is empty

Scenario: Login success
  Given I have users:
    | username  | password      |
    | admin     | my password   |
  When I fill in "username" with "admin"
  And I fill in "password" with "my password"
  And I press "login"
  Then I should be on the ActivityBaseProject home page
