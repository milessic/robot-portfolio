*** Settings ***
Documentation   This is a template
Library   Selenium2Library

*** Variables ***
${BROWSER}    chrome

*** Test Cases ***
Browser
  [Documentation]   This is a template TCs
  [Tags]            Smoke
  Open Browser    https://google.com    ${BROWSER}
  Wait Until Page Contains    Zgadzam się
  Close Browser

*** Keywords ***
