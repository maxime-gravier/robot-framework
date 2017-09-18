*** Settings ***
Library     Selenium2Library
Resource    temp_id_rsrc.robot

*** Keywords ***
User Opens Easylience Login Page
    Open Browser                      http://192.168.0.41    CHROME     # None    http://192.168.0.11:4444/wd/hub
    Maximize Browser Window

Given User Logs In With Login: ${LOGIN} And Password: ${PASSWORD}
    Set Temporary ID Submit
    Input Text                        name=login    ${LOGIN}
    Input Text                        name=password    ${PASSWORD}
    Click Element                     submit_button

Given Login Should Be Successful
    Wait Until Element Is Visible     id=appnav

When User Clicks On The Menu
    Click Element    id=appnav

And User Clicks On My Profile
    Set Temporary ID Profile
    Click Element    my_profile

And User Tries To Change His Password: ${PASSWORD}
    Input Text       name=oldPassword    ${PASSWORD}

But User Gives An Invalid New Password: ${INVALID_NEW_PW}
    Set Temporary ID Save Changes
    Input Text                       name=password    ${INVALID_NEW_PW}
    Input Text                       name=password-confirm    ${INVALID_NEW_PW}
    Click Element                    save_changes

Then Error Message Should Be Displayed
    Set Temporary ID Error Text
    Wait Until Element Is Visible     error_text
    Element Should Contain    error_text    Le mot de passe doit contenir au moins 8 caractères, une lettre minuscule, une lettre majuscule, un chiffre et un caractère spécial (!@#$%^&*()_+-=[]{};':"\\|,.<>/?).
