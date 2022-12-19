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

Feature: Check Shopping Cart Features

 Scenario: Add product into the cart
 Given the user is in the page "https://automationexercise.com/product_details/1"
 When the user clicks ".btn.btn-default.cart" class button
 Then the confirmation cart box is displayed
 And the user clicks ".btn.btn-success.close-modal.btn-block" class button
 
 Scenario: Remove product from the shopping cart
 Given the user is in the page "https://automationexercise.com/view_cart"
 And check id "product-1" exists
 Then the user clicks "[class='cart_quantity_delete'][data-product-id='1']" class button
 And wait 500 mili-seconds
 Then the msg "Cart is empty!" is displayed in "//*[@id='empty_cart']/p/b"
 And wait 500 mili-seconds
 
 Scenario: Make Purchase without beeing logged in
 Given the user is in the page "https://automationexercise.com"
 And log out if siggned in
 And wait 500 mili-seconds
 Then the user is in the page "https://automationexercise.com/product_details/1"
 And wait 1000 mili-seconds
 And the user clicks ".btn.btn-default.cart" class button
 And wait 500 mili-seconds
 And the confirmation cart box is displayed
 And the user clicks "View Cart" partialLinkText button
 And wait 500 mili-seconds
 Then the user clicks ".btn.btn-default.check_out" class button 
 And wait 1000 mili-seconds
 And the msg "Register / Login account to proceed on checkout." is displayed in "//*[@id='checkoutModal']/div/div/div[2]/p[1]"