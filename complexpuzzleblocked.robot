*** Settings ***
Library  BehaviorTreeLibrary
Library  Resources/complexuihelper.py
Resource  Resources/common.robot

Test Setup      Run Keywords
...             Start Application
...  AND        Start Blocker
Test Teardown   Run Keywords
...             Stop Application
...  AND        Stop Blocker

*** Variables ***
${APP}  apps\\ComplexPuzzle

*** Test Cases ***
Complex Puzzle Test BT Style
    One Should Pass
    ...  -  All Should Pass
    ...  -  -  Expect Four In Row
    ...  -  -  Expect Four In Column
    ...  -  -  Check Table As Valid
    ...  -  All Should Pass
    ...  -  -  Expect Four In Positive Diagonal
    ...  -  -  Expect Four In Negative Diagonal
    ...  -  -  Check Table As Valid
    ...  -  Check Login As Invalid
    One Should Pass
    ...  -  All Should Pass
    ...  -  -  Expect Username To Be Valid
    ...  -  -  One Should Pass
    ...  -  -  -   All Should Pass
    ...  -  -  -  -  Expect Password To Be Valid
    ...  -  -  -  -  Check Login As Valid
    ...  -  -  -  Check Login as Invalid
    ...  -  Check Username As Invalid
    Click Input
    Congratulation Should Pop
    Close Popup

Complex Puzzle Test Traditional Style
    ${Row4}     Run Keyword And Return Status  Expect Four In Row
    ${Column4}  Run Keyword And Return Status  Expect Four In Column
    IF  ${Row4} and ${Column4}
        Check Table As Valid
    ELSE
        ${PositiveDiag4}  Run Keyword And Return Status  Expect Four In Positive Diagonal
        ${NegativeDiag4}  Run Keyword And Return Status  Expect Four In Negative Diagonal
        IF  ${PositiveDiag4} and ${NegativeDiag4}
            Check Table As Valid
        ELSE
            Check Table As Invalid
        END
    END
    ${UsernameOk}     Run Keyword And Return Status  Expect Username To Be Valid
    IF  ${UsernameOk}
        ${PasswordOk}     Run Keyword And Return Status  Expect Password To Be Valid
        IF  ${PasswordOk}
            Check Login As Valid
        ELSE
            Check Login As Invalid
        END
    ELSE
        Check Username As Invalid
    END
    Click Input
    Congratulation Should Pop
    Close Popup