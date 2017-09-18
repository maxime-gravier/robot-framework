*** Settings ***
Resource          resource.robot

*** Keywords ***
Login With Valid Credentials
    [Arguments]                     ${username}    ${password}
    Login                           ${username}    ${password}
    Login Should Be Successful
