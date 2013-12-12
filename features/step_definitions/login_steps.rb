require "selenium-webdriver"

Given /^I am on the Login Screen$/ do
  @selenium.get "#{@base_url}"
end

Given(/^I can see the login form$/) do
  username = @selenium.find_element(:id,'username')
  assert(username != nil,"Unable to find username box")

  password = @selenium.find_element(:id,'password')
  assert(password != nil,"Unable to find password box")

  password = @selenium.find_element(:css,"input[type='submit']")
  assert(password != nil,"Unable to find login button")
end

Given(/^I enter the username 'username'$/) do
  username = @selenium.find_element(:id,'username')
  username.clear
  username.send_keys("alex")
end

Given(/^I enter the password 'password'$/) do
  password = @selenium.find_element(:id,'password')
  password.clear
  password.send_keys("right")
end

Given(/^I click the login button$/) do
  button = @selenium.find_element(:css,"input[type='submit']")
  button.click
end

Then(/^I should see the Home Page$/) do
  projects = @selenium.find_element(:xpath,"//h1[contains(.,'Home Page')]")
  assert(projects != nil,"Unable to find Project Admin text")
end