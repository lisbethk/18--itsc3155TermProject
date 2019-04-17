Given(/^I am on the home page$/) do
  visit root_path
end

Then("I should see the {string} field") do |string|
  expect(page).to have_content(string)
end

Then("I should see the {string} content") do |string|
  expect(page).to have_content(string)
end