*** Settings ***
Resource          /Users/Miles/Documents/GitHub/robot-tests/Course/FirstChallenge/Resources/PO/c1.PO.resources.robot
Resource          /Users/Miles/Documents/GitHub/robot-tests/Course/FirstChallenge/Resources/c1.common.robot
Test Setup        c1.common.Begin Web Test
Test Teardown     c1.common.End Web Test

*** Variables ***
${URL}            file:///Users/Miles/Documents/GitHub/robot-tests/Course/FirstChallenge/site/index.html
${BROWSER}        chrome


*** Test Cases ***
Team Section
    app.challenge1.Team Section Is Accessible
    app.challenge1.Verify Team Header Text
