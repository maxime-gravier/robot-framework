*** Settings ***
Documentation     Changes between the new password and the actual one four times (using test template).
Suite Setup       Open Easylience Login Page
Suite Teardown    Close Browser
Force Tags        pw_change
Test Template     Login And Change Password
Library           Selenium2Library
Resource          ../resources/resource2.txt

*** Variables ***
&{PASSWORDS}      password=Nan0cod&    new_password=N4nocod&

*** Test Cases ***
Multiple Password Changes
    &{PASSWORDS}[password]        &{PASSWORDS}[new_password]
    &{PASSWORDS}[new_password]    &{PASSWORDS}[password]
    &{PASSWORDS}[password]        &{PASSWORDS}[new_password]
    &{PASSWORDS}[new_password]    &{PASSWORDS}[password]

*** Keywords ***
Login And Change Password
    [Arguments]                       ${password}                       ${new_password}
    Login With Valid Credentials      maxime.gravier@easylience.com     ${password}
    Go To My Profile
    Change Password                   ${password}                       ${new_password}
    Logout
