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

Feature: Check Forms

Scenario: Fill the contact form correctly
 Given the user is in the page "https://automationexercise.com/contact_us"
 When the user fills "name" data-qa with "tqs"
 And the user fills "email" data-qa with "tqs@wap.cat"
 And the user fills "subject" data-qa with "tqs"
 And the user fills "message" data-qa with "tqs"
 And wait 500 mili-seconds
 And the user clicks "[data-qa='submit-button']" class button
 And wait 500 mili-seconds
 Then check alert msg is "Press OK to proceed!"
 And the alert is accepted
  
Scenario: Fill the subscription form correctly
 Given the user is in the page "https://automationexercise.com"
 And scroll down	
 And wait 1000 mili-seconds
 When the user fills "susbscribe_email" id with "tqsprac@gmail.com"
 And wait 500 mili-seconds
 And the user clicks ".fa.fa-arrow-circle-o-right" class button
 And wait 100 mili-seconds
 Then the msg "You have been successfully subscribed!" is displayed in "//*[@id='success-subscribe']/div"
 And wait 500 mili-seconds
   
Scenario: Write a review of a product
 Given the user is in the page "https://automationexercise.com/product_details/1"
 And scroll down	
 And wait 500 mili-seconds
 When the user fills "name" id with "tqs"
 And the user fills "email" id with "tqsprac@gmail.com"
 And the user fills "review" id with "review"
 And the user clicks "button-review" id button
 And wait 100 mili-seconds
 Then the msg "Thank you for your review." is displayed in "//*[@id='review-section']/div/div/span"
 And wait 500 mili-seconds
 