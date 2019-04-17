Feature: Display timeline
  As a user
  I want to get the list of steps to follow
  So that I can get a job

Scenario: As a user I want to get the list of steps
 Given I am on the home page
 When I click on the "Freshman" button
 Then I should be on the "I have..." page
 When I click on the "No CS experience" button
 Then I should be on the "I want to..." page
 When I click on the "work at Google" button
 Then I should be on the "Learn More" page
 And I should see the "Step 1" content
