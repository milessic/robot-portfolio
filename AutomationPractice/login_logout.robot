*** Settings ***
Library  Selenium2Library

*** Variables ***
${EMAIL}       msictest.qa@gmail.com
${PASSWORD}     123123

*** Test Cases ***
Open Page
  Open Browser    http://automationpractice.com/index.php   chrome
  Wait Until Element Is Visible    //*[@id="header"]/div[2]/div/div/nav/div[1]/a
Login
  Login     ${EMAIL}    ${PASSWORD}
Logout
  Logout

*** Keywords ***
Login     [Arguments]   ${login}  ${password}
#User has to be in Main Page
    Click Element    class=header_user_info
    Wait Until Element Is Visible    id=email
    Input Text    id=email    ${login}
    Input Password    id=passwd    ${password}
    Click Element    id=SubmitLogin
    Wait Until Element Is Visible    class=myaccount-link-list
Logout
    Click Element    //*[@id="header"]/div[2]/div/div/nav/div[2]/a
    Wait Until Element Is Visible    id=passwd
