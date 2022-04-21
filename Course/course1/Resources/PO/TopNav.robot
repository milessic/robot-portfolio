*** Settings ***
Library   Selenium2Library

*** Keywords ***
Search for product    [Arguments]   ${search_text_}
  Input Text    id=twotabsearchtextbox    ${search_text_}
  Click Button    nav-search-submit-button
