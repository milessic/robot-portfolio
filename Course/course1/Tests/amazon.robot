*** Settings ***
Documentation   This is a test for validating if user has to be logged in to purchase product
Resource    /Users/Miles/Documents/GitHub/robot-tests/Course/course1/Resources/amazon.web.gui.robot
Resource    /Users/Miles/Documents/GitHub/robot-tests/Course/course1/Resources/course1.common.robot
Suite Setup     Insert Testing Data
Test Setup      Begin Web Test
Test Teardown   End Web Test
Suite Teardown  Cleanup Testing Data
*** Variables ***
${BROWSER}  headlesschrome
${IMAGE}     //*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[3]/div/div/div/div/div[1]/span/a/div/img[1]
${SEARCH_TERM}    LEGO Porsche 911 (10295) Model Building Kit; Engaging Building Project for Adults; Build and Display The Iconic Porsche
${LOGIN_EMAIL}      msictestqa2@gmail.com
${LOGIN_PASSWORD}   Robot!23


*** Test Cases ***
Logged out user should be able to search for a Product
  [Tags]           Smoke
  amazon.web.gui.Search For Products

Logged out user should be able to view a Product
  [Tags]           Option
  amazon.web.gui.Search For Products
  amazon.web.gui.Select Product From Search Results

Logged out user should not be able to buy product
  [Tags]           Full
  amazon.web.gui.Search For Products
  amazon.web.gui.Select Product From Search Results
  amazon.web.gui.Buy Product And Begin Checkout
  amazon.web.gui.Login     ${LOGIN_EMAIL}    ${LOGIN_PASSWORD}
