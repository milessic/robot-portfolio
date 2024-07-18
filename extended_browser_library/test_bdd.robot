*** Settings ***
Documentation	This is just the small demo of custom library that is extending Browser (Playwright implementation for Robot Framework) in BDD
Resource    ./bdd_resource.resource


*** Test Cases ***
Type In Input
	Given Input Types Page Is Opened
	When I Type "Hello Robot" In Input 0
	Then "Hello Robot" Is In Input 0 
	
Change Input Type And Input
	Given Input Types Page Is Opened
	When I Change Input 0 Type to "email"
	Then Input 0 Type is "email"

