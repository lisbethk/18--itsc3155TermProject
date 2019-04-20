Feature: Goals Content
  As a user
  I want to see all available goal options
  So that I can select the appropriate option for me

Scenario: I want to see all available goals options
 Given I am on the home page
 When I click on the "Freshman" button
 When I click on the "No CS experience" button
 Then I should have button "work at Google"
 And I should have button "find a local job"
 And I should have button "find an internship"
 And I should have button "not sure yet but I still want help"