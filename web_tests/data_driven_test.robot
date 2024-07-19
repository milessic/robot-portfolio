*** Settings ***
Library		MyBrowser.py
Test Template	Change Input Type And Fill It In

*** Test Cases ***		INPUT TYPE		INPUT TEXT
Email Field				email			milosz.m.jura@gmail.com
Telephone Field			telephone		123123123
Url Field				url				https://github.com/milessic
Password Field			password		SuperSecret


*** Keywords ***
Change Input Type And Fill It In
	[Arguments]		${input_type}	${text}
	Open Input Types Page
	Change Input Type		${0}	${input_type}
	Verify Input Type Is	${0}	${input_type}
	Type In Input			${text}		${0}
	Verify Field Text Is 	${text}		${0}

