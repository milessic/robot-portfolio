*** Settings ***
Resource    /Users/Miles/Documents/GitHub/robot-tests/Course/FirstChallenge/Resources/PO/c1.PO.resources.robot

*** Variables ***


*** Keywords ***
Team Section Is Accessible
    c1.TopNav.Open Team Tab
    c1.TeamPage.Verify Team Section Is Loaded

Verify Team Header Text
    c1.TeamPage.Verify Team Header Text
