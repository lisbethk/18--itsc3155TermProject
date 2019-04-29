# CareerQuestions.Dev

A step-by-step guide to getting your first software engineering job.

[![Build Status](https://travis-ci.com/lisbethk/18--itsc3155TermProject.svg?branch=master)](https://travis-ci.com/lisbethk/18--itsc3155TermProject)

## User guide

From the front page (careerquestions.dev) either create an account to save your progress (option A) or proceed without an account (option B)

*Option A*

- Switch to Sign Up tab and fill out email and password field
- Once back on the front page, pick an answer that best describes your class standing
- Pick an answer that best describes your experience in computer science
- Pick an answer that best describes your current goals
- Now follow the steps outlined on the Timeline page
- Mark steps as done once completed

*Option B*

- From the front page pick an answer that best describes your class standing
- Pick an answer that best describes your experience in computer science
- Pick an answer that best describes your current goals
- Now follow the steps outlined on the Timeline page

## Running locally

Make sure you have Ruby installed and a PostgreSQL server running. Use [RVM](https://rvm.io/rvm/install) to switch between different versions of Ruby.

- `bundle install`
- `rake db:migrate`
- `rails server -b localhost -p 8080`

## Getting Started on Heroku with Rails 5.x

https://devcenter.heroku.com/articles/getting-started-with-rails5

## UML Diagram

![uml](https://github.com/lisbethk/18--itsc3155TermProject/blob/master/app/assets/images/uml.PNG)

## User stories

![trello](https://github.com/lisbethk/18--itsc3155TermProject/blob/master/app/assets/images/trello-board.PNG)

## Features

### Implemented

- Login and sign up with Auth0
- Advice personalization based on the user's input
- Ability to mark steps as completed for signed in users

### Future

- Add a menu with information about the app and its owners
- Give users ability to edit their answers and delete their account and data
- Include a progress bar displaying how far along users are in their progress
- Allow users to sign up on the timeline page

## Cucumber test framework

The project uses Cucumber test framework and tests 4 features:

- Validate that app name and information is present
- Validate that all Experience options are presented to user
- Validate that all Goal options are presented to user
- Validate that steps content is displayed correctly after processing user input

## Ethical considerations

We are aware of limitations of advice provided on our website and will communicate this information to our users. We will inform users they should seek out additional resources and verify any advice or deadlines provided as we cannot be held responsible for any changes to the hiring process and expectations. We will also communicate that we are not affiliated with any company or university and are not in charge of any hiring decisions. Users will be advised to exercise common sense.

We hope to mitigate ethical concerns in our project by relying heavily on user input for demographics rather than supplying them ourselves. We don’t ask for user gender, race, sexual orientation, etc. and don’t rely on that information for our project. 

The storage of user information could be misused. We won’t allow communication between users to help resist that temptation. As stated earlier, a goal of ours is to protect all user input.
