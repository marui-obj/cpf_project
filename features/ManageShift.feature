Feature: Manager can manage the shift

Background: Start from Extract chicken feather details page
  
  Given I am on the ActivityBaseProject home page as a manager
  When I press "details" of Extract chicken feather
  Then I should be on Extract chicken feather details page

Scenario: Add shift
  
  When I press "Add shift"
  Then I should be on Add shift page
  When I fill in "Entry Time" with "9.00"
  And I fill in "Exit time" with "16.00"
  And I fill in "Number of Employee" with "30"
  And I press "Add"
  Then I should be on Extract chicken feather details page
  And I should see "shift"

Scenario: Remove shift
  
  When I press "Add shift"
  Then I should be on Add shift page
  When I fill in "Entry Time" with "9.00"
  And I fill in "Exit time" with "16.00"
  And I fill in "Number of Employee" with "30"
  And I press "Add"
  Then I should be on Extract chicken feather details page
  And I should see "shift"
  When I select "shift"
  And I press "Remove shift"
  Then I should be on Extract chicken feather details page