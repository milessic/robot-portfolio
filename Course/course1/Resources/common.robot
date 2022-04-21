*** Settings ***
Library    Selenium2Library


*** Keywords ***
Begin Web Test    [Arguments]    ${browser}
  Open Browser    about:blank    ${browser}

End Web Test
    Close Browser
