*** Settings ***
Documentation   This is a keyword file used for the B2C product.
...             This should be imported in the settings section of the respective test suite files.
...             This contains all keywords that are used commonly.

Library    BehaviorTreeLibrary   # newly added for evaluation
Library    OperatingSystem
Library    FlaUILibrary    timeout=0
Resource   ./TrayIcon.robot
Resource   ./XpathVariables.robot
Resource   ../../Resource/Keyword/Common.robot
Resource   ../../Resource/Keyword/Variables.robot
Resource   ../../Resource/Keyword/Windows.robot

*** Keywords ***

#################
### Close Gui ###
#################
Close GDSC
    [Documentation]                     This keyword closes the GDSC window through clicking on the close button.
    ...
    Click Close                         ${GDSC_CLOSE}     ${GDSC_WINDOW}   msg="GDSC close button could not be found."