*** Settings ***
Resource    /Users/Miles/Documents/GitHub/robot-tests/Course/course1/Resources/PO/PO.resources.robot

*** Keywords ***
Search For Products    [Arguments]    ${image}    ${search_text}
  LandingPage.Load
  LandingPage.Verify Page Loaded
  TopNav.Search for product   ${search_text}
  SearchResults.Verify Product Searched   ${image}

Select Product From Search Results    [Arguments]    ${image}
  SearchResults.Select Product From Search Results    ${image}

Buy Product And Begin Checkout
  Product.Buy Product
  SignIn.Verify Page Contains Email Field
