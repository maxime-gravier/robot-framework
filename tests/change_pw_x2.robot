*** Settings ***
Documentation     Changes the password and then changes it back to the first one (using suite setup/teardown).
Resource          ../resources/resource2.robot
Suite Setup       Open Easylience Login Page
Suite Teardown    Close Browser

*** Variables ***
${USERNAME}       david.meunier@easylience.com
${PASSWORD}       Nan0cod&
${NEW_PASSWORD}   N4nocod&

*** Test Cases ***
Login And Change Password To New One
    Login With Valid Credentials          ${USERNAME}         ${PASSWORD}
    Go To My Profile
    Successfully Change Password          ${PASSWORD}         ${NEW_PASSWORD}
    Logout

Login And Go Back To Previous Password
    Login With Valid Credentials          ${USERNAME}         ${NEW_PASSWORD}
    Go To My Profile
    Successfully Change Password          ${NEW_PASSWORD}         ${PASSWORD}
    Logout
