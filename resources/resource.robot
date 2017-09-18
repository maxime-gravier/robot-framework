*** Settings ***
Library     Selenium2Library
Resource    temp_id_rsrc.robot

*** Keywords ***
Open Easylience Login Page
    Open Browser                      http://192.168.0.41    CHROME     # None    http://192.168.0.11:4444/wd/hub
    Maximize Browser Window

Login
    [Documentation]     User attempts to log in with "login" and "password"
    [Arguments]                       ${login}    ${password}
    Set Temporary ID Submit
    Input Text                        name=login    ${login}
    Input Text                        name=password    ${password}
    Click Element                     submit_button

Login Should Be Successful
    Wait Until Element Is Visible     id=appnav

Click On Menu
    Click Element                     id=appnav

Click On My Profile
    Set Temporary ID Profile
    Click Element                     my_profile

Change Password
    [Arguments]                       ${password}
    Input Text                        name=oldPassword    ${password}

Give An Invalid New Password
    [Arguments]                       ${new_password}
    Set Temporary ID Save Changes
    Input Text                        name=password    ${new_password}
    Input Text                        name=password-confirm    ${new_password}
    Click Element                     save_changes

Error Message Should Be Displayed
    Set Temporary ID Error Text
    Wait Until Element Is Visible     error_text
    Element Should Contain    error_text    Le mot de passe doit contenir au moins 8 caractères, une lettre minuscule, une lettre majuscule, un chiffre et un caractère spécial (!@#$%^&*()_+-=[]{};':"\\|,.<>/?).

Login Should Fail
    Wait Until Element Is Visible     css=body > div.generic-modal.modal.show > div > div > div.modal-footer > button    timeout=2

Successfully Change Password
    [Arguments]                       ${password}    ${new_password}
    Set Temporary ID Save Changes
    Input Text                        name=oldPassword    ${password}
    Input Text                        name=password    ${new_password}
    Input Text                        name=password-confirm    ${new_password}
    Click Element                     save_changes
    Wait Until Element Is Visible     xpath=/html/body/div[3]/div/div/div[2]/button
    Click Element                     xpath=/html/body/div[3]/div/div/div[2]/button

Go To My Profile
    Click On Menu
    Click On My Profile

Logout
    Click Element                     id=appnav
    Click Element                     css=#header_menu > a:nth-child(13) > li > span
    Wait Until Element Is Visible     name=login    timeout=10

Go To Inbox And Write A New SMS
    Click Element                     css=#main > div > div > div:nth-child(2) > div > div > div:nth-child(2) > a > div
    Click Element                     id=btnActionDrop
    Click Element                     css=#main > div > div > div > div:nth-child(4) > div.body > div.card-block > div > div:nth-child(1) > div.btn-group.btn-group-sm.group-filtre.show > div > button:nth-child(2)

Enter Receiver Message and Send
    [Arguments]                       ${receiver}   ${message}
    Input Text                        css=#main > div > div > div > div:nth-child(5) > div > div:nth-child(1) > div:nth-child(3) > div > div > div > div.autocomplete.row.composer-autocomplete.col-md-11.col-12 > div.input-group.col-12 > div.autocomplete-input > input    ${receiver}
    Input Text                        css=#main > div > div > div > div:nth-child(5) > div > div:nth-child(2) > div:nth-child(1) > div > textarea                                                                                                                             ${message}
    Click Element                     css=#main > div > div > div > div:nth-child(5) > div > div.row.composer-row > div > div > button:nth-child(2)
    Wait Until Element Is Visible     css=body > div.generic-modal.modal.show > div > div > div.modal-footer > button
    Click Element                     css=body > div.generic-modal.modal.show > div > div > div.modal-footer > button
    Close Browser
