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


Feature: Check User Functionalities

Scenario: Logout from my account
 Given the user is in the page "https://automationexercise.com/login"
 When the user fills "login-email" data-qa with "tqsprac@gmail.com"
 And wait 500 mili-seconds
 And the user fills "login-password" data-qa with "tqsprac"
 And wait 500 mili-seconds
 And the user clicks "[data-qa='login-button']" class button
 And wait 500 mili-seconds
 And the msg "Logout" is displayed in "//*[@id='header']/div/div/div/div[2]/div/ul/li[4]/a"
 And wait 500 mili-seconds
 Then log out if siggned in
 And wait 1500 mili-seconds
 And the msg "Logout" is not displayed in "//*[@id='header']/div/div/div/div[2]/div/ul/li[4]/a"
 
 
 Scenario: Delete my account
 Given the user is in the page "https://automationexercise.com/login"
 When the user fills "login-email" data-qa with "tqsprac@gmail.com"
 And wait 500 mili-seconds
 And the user fills "login-password" data-qa with "tqsprac"
 And wait 500 mili-seconds
 And the user clicks "[data-qa='login-button']" class button
 And wait 500 mili-seconds
 And the msg "Delete Account" is displayed in "//*[@id='header']/div/div/div/div[2]/div/ul/li[5]/a"
 And wait 500 mili-seconds
 Then delete account
 And wait 1500 mili-seconds
 And the msg "Logout" is not displayed in "//*[@id='header']/div/div/div/div[2]/div/ul/li[4]/a"