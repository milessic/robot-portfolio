*** Settings ***
Library  Selenium2Library

*** Variables ***
${PRODUCT_BUY_NOW}    buy-now-button

*** Keywords ***
Buy Product
  Click Button        ${PRODUCT_BUY_NOW}
