*** Settings ***
Library     Selenium2Library

*** Keywords ***
Set Temporary ID Submit
    Assign Id To Element    css=body > div:nth-child(2) > div > div:nth-child(3) > div > div > div > div > form > button    submit_button

Set Temporary ID Profile
    Assign Id To Element    css=#header_menu > a:nth-child(11) > li > span    my_profile

Set Temporary ID Save Changes
    Assign Id To Element    css=#main > div > div > div:nth-child(2) > div > div > div:nth-child(2) > div > form > button    save_changes

Set Temporary ID Error Text
    Assign Id To Element    css=body > div.generic-modal.modal.show > div > div > div.modal-body > div > div    error_text

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
