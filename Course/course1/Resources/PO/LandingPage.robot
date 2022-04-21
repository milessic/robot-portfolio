*** Settings ***
Library     Selenium2Library

*** Keywords ***
Load
    Go To    https://amazon.com

Verify Page Loaded
    Wait Until Element Is Visible    ${TOPNAV_SEARCH_BAR}
