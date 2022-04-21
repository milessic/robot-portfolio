*** Settings ***
Library   Selenium2Library

*** Variables ***
${TOPNAV_SEARCH_BAR}       id=twotabsearchtextbox
${TOPNAV_SUBMIT_BUTTON}    nav-search-submit-button
*** Keywords ***
Search for product
#[Arguments]   ${search_text_}
  Input Text               ${TOPNAV_SEARCH_BAR}   ${SEARCH_TERM}
  Click Button             ${TOPNAV_SUBMIT_BUTTON}
