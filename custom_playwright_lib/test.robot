*** Settings ***
Library           CustomLib
Library           Browser
#Suite Setup       Setup Test Environment
Suite Teardown    End Test
#Test Setup        Start Test  https://www.google.com  1920x1080
Test Teardown     End Test

*** Test Cases ***
Verify Google Logo Download
    [Documentation]  This test case navigates to Google, downloads the logo, and verifies the downloaded file.
    Setup Test Environment
    Start Test  https://robotframework.org/  1920x1080
    Wait For Robot
    Wait For Elements State     h2  visible
    # Verify Google Logo Download  https://www.google.com  css=#hplogo  ${CURDIR}${/}google_logo.png  ${CURDIR}${/}google_logo_to_compare.png