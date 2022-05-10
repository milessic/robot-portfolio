*** Settings ***
Resource    /Users/Miles/Documents/GitHub/robot-tests/Course/course1/Resources/PO/PO.resources.robot

*** Keywords ***
Search For Products
  LandingPage.Load
  LandingPage.Verify Page Loaded
  TopNav.Search for product
  SearchResults.Verify Product Searched

Select Product From Search Results
  SearchResults.Select Product From Search Results

Buy Product And Begin Checkout
  Product.Buy Product
  SignIn.Verify Page Contains Email Field

Login      [Arguments]    ${login}    ${password}
  SignIn.Login     ${login}   ${password}
