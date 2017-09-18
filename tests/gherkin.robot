*** Settings ***
Resource        ../resources/rsrc_gherkin.robot
Test Setup      User Opens Easylience Login Page

*** Variables ***
${LOGIN}            david.meunier@easylience.com
${PASSWORD}         Nan0cod&
${INVALID_NEW_PW}   Nanocode

*** Test Cases ***
Scénario: User Fails To Change Password Because New Password Is Invalid
    Given User Logs In With Login: ${LOGIN} And Password: ${PASSWORD}
    Given Login Should Be Successful
    When User Clicks On The Menu
    And User Clicks On My Profile
    And User Tries To Change His Password: ${PASSWORD}
    But User Gives An Invalid New Password: ${INVALID_NEW_PW}
    Then Error Message Should Be Displayed
