*** Settings ***
Library  Selenium2Library

*** Keywords ***
Buy Product
  Click Button    buy-now-button

Verify Page Contains Email Field
  Wait Until Element Is Visible    id=ap_email
