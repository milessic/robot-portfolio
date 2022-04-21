*** Settings ***
Library   Selenium2Library

*** Keywords ***
Verify Page Contains Email Field
    Wait Until Element Is Visible    id=ap_email
