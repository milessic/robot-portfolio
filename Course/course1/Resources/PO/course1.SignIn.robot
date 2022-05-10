*** Settings ***
Library   Selenium2Library

*** Variables ***
${SIGNIN_MAIN_HEADING}         xpath=//*[@id="authportal-main-section"]/div[2]/div/div[1]/form/div/div/div/h1
${SIGNIN_EMAIL_FIELD}          id=ap_email
${SIGNIN_CONTINUE_BUTTON}      id=continue
${SIGNIN_PASSWORD_FIELD}       id=ap_password
${SIGNIN_SIGNIN_BUTTON}        id=signInSubmit

*** Keywords ***
Verify Page Contains Email Field
    Page Should Contain Element    ${SIGNIN_MAIN_HEADING}
    Element Text Should Be         ${SIGNIN_MAIN_HEADING}   Sign-In

Login     [Arguments]               ${login}   ${password}
    Input Text        ${SIGNIN_EMAIL_FIELD}   ${login}
    Click Button      ${SIGNIN_CONTINUE_BUTTON}
    Wait Until Element Is Visible    ${SIGNIN_PASSWORD_FIELD}
    Input Password    ${SIGNIN_PASSWORD_FIELD}      ${password}
    Click Button      ${SIGNIN_SIGNIN_BUTTON}
    Wait Until Element Is Visible    ${CHECKOUT_PHONENUMBER_FIELD}
