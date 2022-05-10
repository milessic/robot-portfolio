*** Settings ***
Library   Selenium2Library

*** Variables ***


*** Keywords ***
Verify Product Searched
  Wait Until Element Is Visible    ${IMAGE}

Select Product From Search Results
  Click Image    ${IMAGE}
  Wait Until Element Is Visible    ${PRODUCT_BUY_NOW}
