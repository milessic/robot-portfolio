*** Settings ***
Library   Selenium2Library

*** Keywords ***
Verify Product Searched    [Arguments]   ${image}
  Wait Until Element Is Visible    ${image_}

Select Product From Search Results    [Arguments]    ${image}
  Click Image    ${image_}
  Wait Until Element Is Visible    buy-now-button
