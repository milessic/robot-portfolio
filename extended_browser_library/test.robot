*** Settings ***
Documentation	This is just the small demo of custom library that is extending Browser (Playwright implementation for Robot Framework), Gherkin version is called 'bdd_test.robot'
Library		./MyBrowser.py
Library		Collections
Library    MyBrowser.py
Test Teardown	Run Keyword If   ${TAKE_SCREENSHOTS}		Take Screenshot		fullPage=${True}

*** Variables ***
${HEADLESS}		${True}
${TAKE_SCREENSHOTS}		${True}

*** Test Cases ***
Type In Input
	Open Input Types Page	headless=${HEADLESS}
	Element Is Visible	    .input-item__display > .input-item__display-input
	Type In Input    Hello Robot!	0
	Verify Field Text Is  Hello Robot!   0


Create Multiple Inputs
	@{texts}=	Create List		Hello RobotFramework
	...							I'm Miłosz		
	...							And I like
	...							RobotFramework
	...							Very much	
	...							:)
	Open Input Types Page	headless=${HEADLESS}
	# Add inputs
	FOR  ${i}	IN RANGE	${5}
		Add New Input
	END
	# Fill in inputs values from list
	FOR  ${i}   IN RANGE   ${6}
		Type In Input	${texts}[${i}]  	${i}
	END

Change Input Type And Input
	Open Input Types Page		headless=${HEADLESS}
	Change Input Type    	    ${0}	email
	Verify Input Type Is  	    ${0}    email
	Type In Input			    milosz.m.jura@gmail.com		${0}
	Add New Input
	Change Input Type		${0}	Password
	Verify Input Type Is    ${0}   	Password
	Type In Input	SuperSecret		${0}

