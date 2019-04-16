Feature: App Name
  As a user
  I want to see app's name and description on front page
  So that I know what to expect

Scenario: As a user I want to see app's name and description
 Given I am on the home page
 Then I should see the "CareerQuestions.Dev" content
 And I should see the "A step-by-step guide to getting your first software engineering job" content