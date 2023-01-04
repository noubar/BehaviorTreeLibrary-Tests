*** Settings ***
Library    Process

*** Keywords ***
Stop Application
    Terminate Process   ${PID}  kill=${True}

Start Application
    [Arguments]   ${application}=${APP}
    ${PID}  Start Process  ${application}
    Set Test Variable    ${PID}

Start Blocker
    [Arguments]
    ${BPID}  Start Process  python   -m  BlockerRun.py  cwd=${EXECDIR}\\apps
    Set Test Variable    ${BPID}

Stop Blocker
    Terminate Process   ${BPID}  kill=${True}