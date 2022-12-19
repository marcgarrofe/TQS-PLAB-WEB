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

 Feature: Check Navigation Bar and Categories

 Scenario: Show women dress
 Given the user is in the page "https://automationexercise.com"
 When the user clicks "Products" partialLinkText button
 And the user enters "dress" in the "search_product" input id
 And the user clicks "submit_search" id button
 Then the dress list appears

 Scenario: Search a non existing product
 Given the user is in the page "https://automationexercise.com"
 When the user clicks "Products" partialLinkText button
 And the user enters "barretina" in the "search_product" input id
 And the user clicks "submit_search" id button
 Then the list appears empty

 Scenario: Show products by category
 Given the user is in the page "https://automationexercise.com"
 When the user clicks "KID" partialLinkText button
 And the user clicks "TOPS & SHIRTS" partialLinkText button
 Then the KIDS - TOPS & SHIRTS PRODUCTS list appears