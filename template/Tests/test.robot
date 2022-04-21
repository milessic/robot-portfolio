*** Settings ***
Documentation   This is a template
Library   Selenium2Library

*** Variables ***

*** Test Cases ***
Browser
  Open Browser    https://google.com    chrome
  Wait Until Page Contains    Zgadzam się
  Close Browser

*** Keywords ***
