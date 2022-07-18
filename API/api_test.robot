*** Settings ***
Library       RequestsLibrary
Library       String
Library       JSONLibrary
Suite Setup   Start Session


*** Variables ***
${TOKEN}          3821533292fc25f66790e457f34ee94f1aa146757fad45edde1e1749379c3fcb
&{headers}        Authorization=Bearer ${TOKEN}

*** Test Cases ***
T001_GET_API_STATUS
  ${response}=  GET On Session    simpleBooks    status
  Status Should Be         200   ${response}

T002_GET_BOOKS
  ${response}=  GET On Session    simpleBooks    url=books?type=non-fiction
  Status Should Be         200    ${response}

T003_GET_ALL_ORDERS
  ${response}=             GET On Session     simpleBooks     orders  headers=${headers}
  ${json_contents}=        Convert String To Json    ${response.content}
  ${contents_customerName}=        Get Value From Json       ${json_contents}    $..customerName
  Log To Console          ${contents_customerName}

T004_POST_ORDEER_A_BOOK
  &{body}=                Create Dictionary    bookId=3  customnerName=miles sic
  #${body}=     Set Variable    {"bookId":3, "customerName":"miles sic"}
  Log To Console          ${body}


  #${json_body}=   Convert String To Json  ${body}
  ${response}=            POST On Session     simpleBooks   orders   json=${body}  headers=${headers}
  Status Should Be        201  ${response}

  ${json_contents}=       Convert String To Json  ${response.content}
  ${contents_created}=    Get Value From Json  ${json_contents}   $..created
  ${contents_orderId}=    Get Value From Json  ${json_contents}   $..orderId
  Log To Console          ${contents_orderId}
  Should Be True          ${contents_created}
  ${contents_orderId}=    Convert To String    ${contents_orderId}
  ${contents_orderId}=    Remove String Using Regexp    ${contents_orderId}    ['\\[\\],]
  ${contents_orderId}=    Set Variable    ${contents_orderId}
T005_GET_CERTAIN_ORDER
  ${response}=      Get On Session   simpleBooks   orders/Q3CVRMq-YjKfqjEk76E-1     headers=${headers}
  Status Should Be        200



*** Keywords ***
Start Session
    Create Session      simpleBooks     https://simple-books-api.glitch.me/

Log To Console REST things    [Arguments]   ${res.h}  ${res.s_c}  ${res.c}
  Log To Console  "  "
  Log To Console  headers:: ${res.h}
  Log To Console  statusc:: ${res.s_c}
  Log To Console  content:: ${res.c}

#Generate Random Name
