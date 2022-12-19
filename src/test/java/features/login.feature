#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template

Feature: Check Signup/Login Page
 
Scenario: Login with an unexisting account
 Given the user is in the page "https://automationexercise.com/login"
 When the user fills "login-email" data-qa with "tqsprac@uab.cat"
 And wait 500 mili-seconds
 And the user fills "login-password" data-qa with "tqsprac"
 And wait 500 mili-seconds
 And the user clicks "[data-qa='login-button']" class button
 Then the msg "Your email or password is incorrect!" is displayed in "//*[@id='form']/div/div/div[1]/div/form/p"
  
Scenario: Signup with an unexisting account
 Given the user is in the page "https://automationexercise.com"
 And delete account
 And the user is in the page "https://automationexercise.com/login"
 And the user fills "signup-name" data-qa with "123"
 And the user fills "signup-email" data-qa with "tqsprac@gmail.com"
 And wait 500 mili-seconds
 And the user clicks "[data-qa='signup-button']" class button
 And wait 500 mili-seconds
 And the user fills "password" data-qa with "tqsprac"
 And wait 500 mili-seconds
 And scroll down "250"
 And the user fills "first_name" data-qa with "123"
 And the user fills "last_name" data-qa with "123"
 And the user fills "address" data-qa with "123"
 And the user fills "state" data-qa with "123"
 And the user fills "city" data-qa with "123"
 And the user fills "zipcode" data-qa with "123"
 And the user fills "mobile_number" data-qa with "123"
 And wait 500 mili-seconds
 And scroll down "250"
 And the user clicks "[data-qa='create-account']" class button
 And wait 500 mili-seconds
 Then the msg "ACCOUNT CREATED!" is displayed in "//*[@id='form']/div/div/div/h2"
 And wait 1500 mili-seconds
 And the user is in the page "https://automationexercise.com"
 And wait 500 mili-seconds
 #And delete account
 And log out if siggned in
 
 Scenario: Signup with an existing account
 Given the user is in the page "https://automationexercise.com/login"
 When the user fills "signup-name" data-qa with "tqs"
 And wait 500 mili-seconds
 And the user fills "signup-email" data-qa with "tqsprac@gmail.com"
 And wait 500 mili-seconds
 And the user clicks "[data-qa='signup-button']" class button
 Then the msg "Email Address already exist!" is displayed in "/html/body/section/div/div/div[3]/div/form/p"
 
 Scenario: Login with an existing account
  Given the user is in the page "https://automationexercise.com/login"
  When the user fills "login-email" data-qa with "tqsprac@gmail.com"
  And wait 500 mili-seconds
  And the user fills "login-password" data-qa with "tqsprac"
  And wait 500 mili-seconds
  And the user clicks "[data-qa='login-button']" class button
  And wait 500 mili-seconds
  Then the msg "Logout" is displayed in "//*[@id='header']/div/div/div/div[2]/div/ul/li[4]/a"
 