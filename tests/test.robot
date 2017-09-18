*** Settings ***
Resource        resource.robot
Test Setup      Open Easylience Login Page

*** Variables ***
${LOGIN}            david.meunier@easylience.com
${PASSWORD}         Nan0cod&
${INVALID_NEW_PW}   Nanocode

*** Test Cases ***
User Fails To Change Password Because New Password Is Invalid
    Login    ${LOGIN}    ${PASSWORD}
    Login Should Be Successful
    Click On Menu
    Click On My Profile
    Change Password    ${PASSWORD}
    Give An Invalid New Password    ${INVALID_NEW_PW}
    Error Message Should Be Displayed
