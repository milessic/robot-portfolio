*** Settings ***
Library  Selenium2Library

*** Variables ***
${EMAIL}
${PASSWORD}

*** Test Cases ***
Open Page
  Open Browser    http://automationpractice.com/index.php   chrome
  Wait Until Element Is Visible    //*[@id="block_top_menu"]/ul/li[1]/a
  Mouse Over    //*[@id="block_top_menu"]/ul/li[1]/a
  Wait Until Element Is Visible    //*[@id="block_top_menu"]/ul/li[1]/ul/li[1]/ul/li[1]/a
  Click Element    //*[@id="block_top_menu"]/ul/li[1]/ul/li[1]/ul/li[1]/a
  Wait Until Element Is Visible    //*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img
  Click Element    //*[@id="center_column"]/ul/li/div/div[2]/h5/a
  Wait Until Element Is Visible    id=add_to_cart
    

*** Keywords ***
