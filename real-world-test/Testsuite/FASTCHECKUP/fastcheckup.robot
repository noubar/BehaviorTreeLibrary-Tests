# This test case is a real-world example used by G DATA CyberDefense AG
# and considered to be one of the simplest.
# Note: This project is being presented only for demonstration purposes.
# Due to data privacy concerns certain components are excluded such as the executor-
# program gadgeto.exe and some other supported keywords, making this test unexecutable.
# Censored data will be replaced with 'XXX'.

# The demonstrated test case will be used to evaluate the integration of behavior tree in Robot Framework.

*** Settings ***
Documentation   This suite covers MS FastCheckUp smoketests
...             To execute this suite in the TestAutoamtion infrastructure use the Generic pipeline.
...
...             How to execute manually:
...                 B2C:
...                     1. Run Gadgeto.exe -p B2C -t FastCheckUp
...                 B2B:
...                     1. None of the tests in this suite are implemented for B2B yet.
...                 MMS:
...                     1. None of the tests in this suite are implemented for MMS yet.
...
...                 General preconditions:
...                     Can be found on XXX
...
...                 Responsible teams and persons for this suite:
...                     Feature contact person:  XXX
...                     Analysis of results:     XXX
...                     Development of tests:    XXX

Resource   ../../B2C/Keyword/Common.robot
Library    BehaviorTreeLibrary   # newly added for evaluation

Suite Setup     Run Keywords  Write StartTime
...             AND           Write Suite Metadata
...             AND           Start Auto Background Clicker
...             AND           Create Directory   ${DUMPS_FOLDER}
Suite Teardown  Stop Auto Background Clicker

*** Test Cases ***

# This is 100% abstracted to be a one scentence which is easy to understand
# GDSC = G DATA Security Center (Applications Main GUI window)
# To know the steps of the test case you need to follow the keywords deeper.

Start Client UI From Tray
    [Documentation]             This test case opens the client UI.
    ...
    [Tags]    B2C:FastCheckUp
    Open GDSC By Tray
    [Teardown]    Close GDSC

# BT = Behavior Tree
# The following example illustrates, how it is even with BT not possible to include
# every base keyword directly into the test case wihtout abstraction by still preserving the readability.

Start Client UI From Tray BT All Steps In Here
    [Documentation]             This test case opens the client UI.
    ...
    [Tags]    B2C:FastCheckUp
    One Should Pass
    ...  -  Variable Should Exist   \${NotGrouped}
    ...  -  All Should Pass
    ...  -  -  Wait Until Keyword Succeeds  10x  100ms  Element Should Exist  \${SYSTEM_TRAY_GD_TRAY_ICON}
    ...  -  -  Set Global Variable   $NotGrouped  \${True}
    ...  -  All Should Pass
    ...  -  -  Element Should Exist    \${SYSTEM_TRAY_GROUPING}   msg="Tray icon is not present on sys tray and overflow area does not exist!"
    ...  -  -  Open Notification Overflow Area
    ...  -  -  Wait Until Keyword Succeeds  15x  200ms    Element Should Exist    \${NOTIFICATION_OVERFLOW_GD_TRAY_ICON}
    ...  -  -  Set Suite Variable   $NotGrouped  \${False}
    ...  -  -  Close Notification Overflow Area
    ...  -  Fail    msg="G DATA tray icon could not be found."
    One Should Pass
    ...  -  All Should Pass
    ...  -  -  Should Be Equal   \${NotGrouped}  \${}
    ...  -  -  One Should Pass
    ...  -  -  -  Wait Until Keyword Succeeds  5x  10ms  Element Should Not Exist  ${NOTIFICATION_POPUP_WINDOW}
    ...  -  -  -  All Should Pass
    ...  -  -  -  -  Wait Until Keyword Succeeds  2x  10ms  Element Should Exist  ${NOTIFICATION_POPUP_DISMISS}
    ...  -  -  -  -  Click Close  ${NOTIFICATION_POPUP_DISMISS}  ${NOTIFICATION_POPUP_WINDOW}  ${NOTIFICATION_POPUP_DISMISS}  ignoreIfAlreadyClosed=True
    ...  -  -  -  Click Close  ${NOTIFICATION_POPUP_WINDOW}   ignoreIfAlreadyClosed=True
    ...  -  -  One Should Pass
    ...  -  -  - Element Should Not Exist  ${NOTIFICATION_POPUP_CLOSE}
    ...  -  -  - Click Close  ${NOTIFICATION_POPUP_CLOSE}  clickCloseWait=10ms  ignoreIfAlreadyClosed=True
    ...  -  -      Double Click Open               ${SYSTEM_TRAY_GD_TRAY_ICON}           ${GDSC_WINDOW}           msg="GDSC Window could not be opened via Tray."
    ...  -  All Should Pass
    ...  -  -  Close If Notification Tray Popups    # <--- This still needs to be expanded
    ...  -  -  Click Open  ${SYSTEM_TRAY_GROUPING}  ${NOTIFICATION_OVERFLOW}  clickOpenWait=10ms  ignoreIfAlreadyOpen=True  msg="Group Icon could not be clicked or found in system tray!"
    ...  -  -  One Should Pass
    ...  -  -  -  Double Click Open    ${NOTIFICATION_OVERFLOW_GD_TRAY_ICON}  ${GDSC_WINDOW}    ignoreIfAlreadyOpen=True
    ...  -  -  -  All Should Pass
    ...  -  -  -  -  Close If Notification Tray Popups  # <--- This still needs to be expanded
    ...  -  -  -  -  Click Close  ${SYSTEM_TRAY_GROUPING}  ${NOTIFICATION_OVERFLOW}  clickCloseWait=10ms  ignoreIfAlreadyClosed=True  msg="Group Icon could not be clicked or found in system tray!"
    ...  -  -  -  -  Fail    msg="GDSC Window could not be opened via Tray in Notification Overflow."

# Another possible way to rewrite this test case with BT
# is this test case, where the whole test case is one BT but still uses some abstraction

Start Client UI From Tray BT 1
    [Documentation]             This test case opens the client UI.
    ...
    [Tags]    B2C:FastCheckUp
    One Should Pass
    ...  -  All Should Pass
    ...  -  -  Tray Icon Should Not Be Grouped  # this keyword is implemented new
    ...  -  -  Close If Notification Tray Popups BT   # redundancy
    ...  -  -  Open GDSC By System Tray
    ...  -  All Should Pass
    ...  -  -  Close If Notification Tray Popups BT  # redundancy i needed to use the same keyword twice
    ...  -  -  Open GDSC By Notification Overflow
    [Teardown]    Close GDSC

# As you see the test case above which is the equivalent to the original robot test case
#    [Tags]   B2C:FastCheckUp
#    Is Tray Icon NotGrouped
#    Close If Notification Tray Popups
#    IF  ${NotGrouped}==True
#        Open GDSC By System Tray
#    ELSE
#        Open GDSC By Notification Overflow
#    END
#   [Teardown]  Close GDSC

# The kw "Is Tray Icon Not Grouped" is rewritten to be "Tray Icon Should Not Be Grouped"
# but now the test case is one line longer than it's original. One keyword is used twice.
# This is why we do not suggest to make every keyword part of BT in test case
# if you are translating an existing test case. 
# But we rather suggest to only to use the BT in places or under keywords,
# where it is needed like the follow.
# Hybrid solution: follow the kw "Open GDSC By Tray BT" deeper and see the difference.

Start Client UI From Tray BT Best Approach   # :)
    [Documentation]             This test case opens the client UI.
    ...
    [Tags]    B2C:FastCheckUp
    Open GDSC By Tray BT
    [Teardown]    Close GDSC
