*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
At start the counter is zero
    Go To  ${HOME_URL}
    Title Should Be  Laskuri
    Page Should Contain  nappia painettu 0 kertaa

When button pressed twice the counter is two
    Go To  ${HOME_URL}
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 2 kertaa

When counter is set to 5
    Go To  ${HOME_URL}
    Set Value To    5
    Value Should Be    5
    
*** Keywords ***

Set Value To
    [Arguments]    ${value}
    Input Text    name=new_value    ${value}
    Click Button   Aseta arvo

Value Should Be
    [Arguments]    ${expected_value}
    Page Should Contain    ${expected_value}
	
