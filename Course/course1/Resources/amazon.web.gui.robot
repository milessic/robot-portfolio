*** Settings ***
Library   Selenium2Library

*** Keywords ***
Search For Products    [Arguments]    ${image}
  Go To    https://amazon.com
  Wait Until Element Is Visible    id=twotabsearchtextbox
  Input Text    id=twotabsearchtextbox    LEGO Porsche 911 (10295) Model Building Kit; Engaging Building Project for Adults; Build and Display The Iconic Porsche 911
  Click Button    nav-search-submit-button
  Wait Until Element Is Visible    ${image}

Select Product From Search Results    [Arguments]    ${image}
  Click Image    ${image}
  Wait Until Element Is Visible    buy-now-button

Buy Product And Begin Checkout
  Click Button    buy-now-button
  Wait Until Element Is Visible    id=ap_email
