*** Settings ***
Documentation     Changes the password and then changes it back to the first one (using suite setup/teardown).
Suite Setup       Open Easylience Login Page
Suite Teardown    Close Browser
Force Tags        pw_change
Resource          ../resources/resource2.txt

*** Variables ***
${USERNAME}       support.nanocode.cecaz-easylience.com@e.fr
${PASSWORD}       Nan0cod&
${NEW_PASSWORD}   N4nocod&

*** Test Cases ***
Login And Change Password To New One
    Login With Valid Credentials          ${USERNAME}         ${PASSWORD}
    Go To My Profile
    Change Password                       ${PASSWORD}         ${NEW_PASSWORD}
    Logout

Login And Go Back To Previous Password
    Login With Valid Credentials          ${USERNAME}         ${NEW_PASSWORD}
    Go To My Profile
    Change Password                       ${NEW_PASSWORD}         ${PASSWORD}
    Logout
