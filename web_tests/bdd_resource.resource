*** Settings ***
Library		MyBrowser.py	headless=${True}	


*** Keywords ***
Input Types Page Is Opened
	Open Input Types Page 	
	
I Type "${phrase}" In Input ${field_index} 
	Type In Input    ${phrase}	${field_index}

"${phrase}" Is In Input ${field_index}
	Verify Field Text Is   	${phrase}	${field_index}

I Change Input ${field_index} Type To "${input_type}"
	Change Input Type   ${field_index}		${input_type}

Input ${field_index} Type is "${input_type}"
	Verify Input Type Is   ${field_index}	${input_type}
	

