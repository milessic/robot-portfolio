*** Settings ***
Documentation   This is a test for validating if user has to be logged in to purchase product
Resource    /Users/Miles/Documents/GitHub/robot-tests/Course/course1/Resources/amazon.web.gui.robot
Resource    /Users/Miles/Documents/GitHub/robot-tests/Course/course1/Resources/common.robot
Suite Setup     Insert Testing Data
Test Setup      Begin Web Test  ${BROWSER}
Test Teardown   End Web Test
Suite Teardown  Cleanup Testing Data
*** Variables ***
${BROWSER}  chrome
${IMAGE}    //*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[3]/div/div/div/div/div[1]/span/a/div/img[1]

*** Test Cases ***
User can use Serach
  [Documentation]  To use search
  [Tags]           Smoke
#  common.Begin Web Test   ${BROWSER}
  amazon.web.gui.Search For Products   ${IMAGE}
#  common.End Web Test

User cannot buy Products without login
  [Documentation]   To verify if user has to be logged in to buy products
  [Tags]           Smoke
  amazon.web.gui.Search For Products   ${IMAGE}
  amazon.web.gui.Select Product From Search Results    ${IMAGE}
  amazon.web.gui.Buy Product And Begin Checkout
