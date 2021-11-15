Feature: Manager can manage employee work

Background: Start from Extract chicken feather shift details page

  Given I am on the ActivityBaseProject home page as a manager
  When I press "details" of Extract chicken feather
  Then I should be on Extract chicken feather details page
  When I press "Add shift"
  Then I should be on Add shift page
  When I fill in "Entry Time" with "9.00"
  And I fill in "Exit time" with "16.00"
  And I fill in "Number of Employee" with "30"
  And I press "Add"
  Then I should be on Extract chicken feather details page
  And I should see "shift"
  When I press "details"
  Then I should be on Extract chicken feather shift details page

Scenario: Add employee
  
  When I press "Add" from Employees
  Then I should be on Extract chicken feather shift details page
  And I should see "employee"

Scenario: Remove employee

  When I press "Add" from Employees
  Then I should be on Extract chicken feather shift details page
  And I should see "employee"
  When I press "out" from "employee"
  Then I should be on Extract chicken feather shift details page

Scenario: Adjust OT time

  When I press "ALL"
  And I fill "OT" with "3"
  And I press "Increase"
  Then I should be on Extract chicken feather shift details page

Scenario: Switch between Plan & Actual

  When I press "Actual"
  Then I should be on Extract chicken feather shift details actual page
  When I press "Plan"
  Then I should be on Extract chicken feather shift details page