*** Settings ***
Resource          resource2.robot
Suite Setup       Open Easylience Login Page
Suite Teardown    Close Browser
Test Template     Login And Change Password

*** Variables ***
&{PASSWORDS}      pw1=Nan0cod&    pw2=N4nocod&    pw3=Nanoc0d&    pw4=N4n0cod&

*** Test Cases ***
Multiple Password Changes
    &{PASSWORDS}[pw1]    &{PASSWORDS}[pw2]
    &{PASSWORDS}[pw2]    &{PASSWORDS}[pw3]
    &{PASSWORDS}[pw3]    &{PASSWORDS}[pw4]
    &{PASSWORDS}[pw4]    &{PASSWORDS}[pw1]

*** Keywords ***
Login And Change Password
    [Arguments]                       ${password}    ${new_password}
    Login With Valid Credentials      david.meunier@easylience.com     ${password}
    Go To My Profile
    Successfully Change Password      ${password}    ${new_password}
    Logout
