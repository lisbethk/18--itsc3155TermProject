Feature: Experience Content
  As a user
  I want to see all available experience options
  So that I can select the appropriate option for me

Scenario: I want to see all available experience options
 Given I am on the home page
 When I click on the "Freshman" button
 Then I should have button "No CS experience"
 And I should have button "Some experience (hackathons/summer research)"
 And I should have button "At least one internship"