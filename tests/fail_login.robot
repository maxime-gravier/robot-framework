*** Settings ***
Resource          resource.robot
Suite Setup       Open Easylience Login Page
Suite Teardown    Close Browser
Test Teardown     Click Element    css=body > div.generic-modal.modal.show > div > div > div.modal-footer > button
Test Template     Login With Invalid Credentials Should Fail

*** Variables ***
${VALID_USER}         david.meunier@easylience.com
${VALID_PASSWORD}     Nan0cod&

*** Test Cases ***                    Username         Password
Invalid Username                      invalid@mail     ${VALID_PASSWORD}
Invalid Password                      ${VALID_USER}    invalid
Invalid Username And Password         invalid@mail     invalid

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]             ${username}    ${password}
    Login                   ${username}    ${password}
    Login Should Fail
