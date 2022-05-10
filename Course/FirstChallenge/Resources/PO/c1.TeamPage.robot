*** Settings ***
Library     Selenium2Library

*** Variables ***
${TEAM_HEADER}         xpath=//*[@id="team"]/div/div[1]/div/h2
${TEAM_SUBHEADER}      xpath=//*[@id="team"]/div/div[1]/div/h3
${TEAM_KAY_PHOTO}      xpath=//*[@id="team"]/div/div[2]/div[1]/div/img

*** Keywords ***
Verify Team Section Is Loaded
    Wait Until Element Is Visible    ${TEAM_HEADER}
    Wait Until Element Is Visible    ${TEAM_KAY_PHOTO}

Verify Team Header Text
    Textarea Value Should Be    ${TEAM_HEADER}    OUR AMAZING TEAM
