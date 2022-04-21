*** Settings ***
Library   Selenium2Library

*** Variables ***
${SIGNIN_MAIN_HEADING}    xpath=//*[@id="authportal-main-section"]/div[2]/div/div[1]/form/div/div/div/h1

*** Keywords ***
Verify Page Contains Email Field
    Page Should Contain Element    ${SIGNIN_MAIN_HEADING}
    Element Text Should Be         ${SIGNIN_MAIN_HEADING}   Sign-In    
