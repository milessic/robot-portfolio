*** Settings ***
Library    Selenium2Library

*** Variables ***
${TOPNAV_SERVICES_LINK}     xpath=//*[@id="bs-example-navbar-collapse-1"]/ul/li[2]/a
${TOPNAV_PORTOFLIO_LINK}    xpath=//*[@id="bs-example-navbar-collapse-1"]/ul/li[3]/a
${TOPNAV_ABOUT_LINK}        xpath=//*[@id="bs-example-navbar-collapse-1"]/ul/li[4]/a
${TOPNAV_TEAM_LINK}         xpath=//*[@id="bs-example-navbar-collapse-1"]/ul/li[5]/a
${TOPNAV_CONTACT_LINK}         xpath=//*[@id="bs-example-navbar-collapse-1"]/ul/li[6]/a


*** Keywords ***
Open Team Tab
    Wait Until Element Is Visible    ${TOPNAV_TEAM_LINK}
    Click Element                    ${TOPNAV_TEAM_LINK}
