*** Settings ***
Library  BehaviorTreeLibrary
Library  Resources/simpleuihelper.py
Resource  Resources/common.robot

Test Setup      Start Application
Test Teardown   Stop Application

*** Variables ***
${APP}  apps\\SimplePuzzle


*** Test Cases ***
Simple Puzzle Test Traditional Style
    Select Stage1
    Switch Username And Password
    Click Input
    ${Flag1}  Copy Flag
    Close Popup
    Select Stage2
    Enter First Solution
    Enter Second Solution
    Enter Third Solution
    Click Input
    ${Flag2}  Copy Flag
    Close Popup
    Select Stage3
    Enter Flags  ${Flag1}  ${Flag2}
    Click Input
    Congratulation Should Pop
    Close Popup

Simple Puzzle Test BT Style
    All Should Pass
...  -  Select Stage1
...  -  Switch Username And Password
...  -  Click Input
...  -  Assign Return As Scope Variable  $Flag1  Copy Flag
...  -  Close Popup
...  -  Select Stage2
...  -  Enter First Solution
...  -  Enter Second Solution
...  -  Enter Third Solution
...  -  Click Input
...  -  Assign Return As Scope Variable  $Flag2  Copy Flag
...  -  Close Popup
...  -  Select Stage3
...  -  Enter Flags  \${Flag1}  \${Flag2}
...  -  Click Input
...  -  Congratulation Should Pop
...  -  Close Popup