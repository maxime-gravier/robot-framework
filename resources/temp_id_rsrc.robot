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
