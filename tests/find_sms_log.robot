*** Settings ***
Library         MyLibrary
Resource        resource2.robot
Suite Setup     Run Keywords      Open Easylience Login Page  AND  Login With Valid Credentials  ${USERNAME}  ${PASSWORD}
Suite Teardown  Clear Log File    workspace/dev/backend-v2/${LOG_FILE_NAME}

*** Variables ***
${USERNAME}       david.meunier@easylience.com
${PASSWORD}       Nan0cod&
${RECEIVER}       0605040302
${MESSAGE}        Hello
${LOG_FILE_NAME}  sms.log

*** Test Cases ***
Send SMS And Check In Logs
    Given Go To Inbox And Write a New SMS
    When Enter Receiver Message And Send         ${RECEIVER}   ${MESSAGE}
    Then Check Text In Log File                   workspace/dev/backend-v2/${LOG_FILE_NAME}    [smsHelper][sendSms] sms body: ${MESSAGE}
    Then Check Text In Log File                   workspace/dev/backend-v2/${LOG_FILE_NAME}    [smsHelper] mobile line value=${RECEIVER}

*** Keywords ***
Check Text In Log File
    [Arguments]   ${log_file_path}    ${text}
    Check Text In File      ${log_file_path}    ${text}

Clear Log File
    [Arguments]   ${log_file_path}
    Clear File    ${log_file_path}
