*** Settings ***
Documentation	This is the Test Suite that uses [https://github.com/vdespa/introduction-to-postman-course/blob/main/README.md|vdespa - simple-books-api] API to fetch Bearer and perform tests.
...
...				It doesn't use custom python libraries, but full-stack Robot libraries, that may be easier for beginners
Library			Collections
Library       RequestsLibrary
Library       String
Library       JSONLibrary
Suite Setup   Start Session


*** Variables ***
&{headers}        Authorization=${None}  # Set in Start Session
${order_id}=	  ${None}	# Set in T004

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
  Log 					   ${contents_customerName}

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
  Log 					  ${contents_orderId}
  Should Be True          ${contents_created}
  ${contents_orderId}=    Convert To String    ${contents_orderId}
  ${contents_orderId}=    Remove String Using Regexp    ${contents_orderId}    ['\\[\\],]
  ${order_id}=    Set Variable    ${contents_orderId}
  Set Suite Variable		${order_id}

T005_GET_CERTAIN_ORDER
  ${response}=      Get On Session   simpleBooks   orders/${order_id}     headers=${headers}
  Status Should Be        200


*** Keywords ***
Start Session
    Create Session      simpleBooks     https://simple-books-api.glitch.me/
	# Fetching Token
	# Get Uniquie id
	${unique_id}=	Get Time		epoch
	${auth_body}=	Evaluate	{"clientName": "robot-requests", "clientEmail": "mail${unique_id}@totally.legit.test"}
	${auth_resp}=	POST On Session		simpleBooks		 api-clients	json=${auth_body}
	${resp_json}=	Convert String To Json	${auth_resp.content}
	${auth_token}=	Get Value From Json		${resp_json}	accessToken
	Set To Dictionary     ${headers}	Authorization=Bearer ${auth_token}[0]

