When(/^I click on the "([^"]*)" button$/) do |button|
  click_button(button)
end

Then(/^I should be on the "([^"]*)" page$/) do |page_name|
  expect(page).to have_content(page_name)
end