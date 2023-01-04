*** Settings ***
Library  BehaviorTreeLibrary
Library  Resources/complexuihelper.py
Resource  Resources/common.robot

*** Variables ***
${APP}  apps\\ComplexPuzzle

*** Test Cases ***

Complex Puzzle Test BT Style All Branches Executed
    Repeat Until All Branches Are Executed
    ...  All Should Pass
    ...  -  Start Application
    ...  -  One Should Pass
    ...  -  -  All Should Pass
    ...  -  -  -  Expect Four In Row
    ...  -  -  -  Expect Four In Column
    ...  -  -  -  Check Table As Valid
    ...  -  -  All Should Pass
    ...  -  -  -  Expect Four In Positive Diagonal
    ...  -  -  -  Expect Four In Negative Diagonal
    ...  -  -  -  Check Table As Valid
    ...  -  -  Check Login As Invalid
    ...  -  One Should Pass
    ...  -  -  All Should Pass
    ...  -  -  -  Expect Username To Be Valid
    ...  -  -  -  One Should Pass 
    ...  -  -  -  -   All Should Pass
    ...  -  -  -  -  -  Expect Password To Be Valid
    ...  -  -  -  -  -  Check Login As Valid
    ...  -  -  -  -  Check Login as Invalid
    ...  -  -  Check Username As Invalid
    ...  -  Click Input
    ...  -  Congratulation Should Pop
    ...  -  Close Popup
    ...  -  Stop Application

Complex Puzzle Test BT Style All Lines Executed
    Repeat Until All Lines Are Executed
    ...  All Should Pass
    ...  -  Start Application
    ...  -  One Should Pass
    ...  -  -  All Should Pass
    ...  -  -  -  Expect Four In Row
    ...  -  -  -  Expect Four In Column
    ...  -  -  -  Check Table As Valid
    ...  -  -  All Should Pass
    ...  -  -  -  Expect Four In Positive Diagonal
    ...  -  -  -  Expect Four In Negative Diagonal
    ...  -  -  -  Check Table As Valid
    ...  -  -  Check Login As Invalid
    ...  -  One Should Pass
    ...  -  -  All Should Pass
    ...  -  -  -  Expect Username To Be Valid
    ...  -  -  -  One Should Pass 
    ...  -  -  -  -   All Should Pass
    ...  -  -  -  -  -  Expect Password To Be Valid
    ...  -  -  -  -  -  Check Login As Valid
    ...  -  -  -  -  Check Login as Invalid
    ...  -  -  Check Username As Invalid
    ...  -  Click Input
    ...  -  Congratulation Should Pop
    ...  -  Close Popup
    ...  -  Stop Application

Complex Puzzle Test BT Style All Branches Passed
    Repeat Until All Branches Are Passed
    ...  All Should Pass
    ...  -  Start Application
    ...  -  One Should Pass
    ...  -  -  All Should Pass
    ...  -  -  -  Expect Four In Row
    ...  -  -  -  Expect Four In Column
    ...  -  -  -  Check Table As Valid
    ...  -  -  All Should Pass
    ...  -  -  -  Expect Four In Positive Diagonal
    ...  -  -  -  Expect Four In Negative Diagonal
    ...  -  -  -  Check Table As Valid
    ...  -  -  Check Login As Invalid
    ...  -  One Should Pass
    ...  -  -  All Should Pass
    ...  -  -  -  Expect Username To Be Valid
    ...  -  -  -  One Should Pass 
    ...  -  -  -  -   All Should Pass
    ...  -  -  -  -  -  Expect Password To Be Valid
    ...  -  -  -  -  -  Check Login As Valid
    ...  -  -  -  -  Check Login as Invalid
    ...  -  -  Check Username As Invalid
    ...  -  Click Input
    ...  -  Congratulation Should Pop
    ...  -  Close Popup
    ...  -  Stop Application

Complex Puzzle Test BT Style All Lines Passed
    Repeat Until All Lines Are Passed
    ...  All Should Pass
    ...  -  Start Application
    ...  -  One Should Pass
    ...  -  -  All Should Pass
    ...  -  -  -  Expect Four In Row
    ...  -  -  -  Expect Four In Column
    ...  -  -  -  Check Table As Valid
    ...  -  -  All Should Pass
    ...  -  -  -  Expect Four In Positive Diagonal
    ...  -  -  -  Expect Four In Negative Diagonal
    ...  -  -  -  Check Table As Valid
    ...  -  -  Check Login As Invalid
    ...  -  One Should Pass
    ...  -  -  All Should Pass
    ...  -  -  -  Expect Username To Be Valid
    ...  -  -  -  One Should Pass 
    ...  -  -  -  -   All Should Pass
    ...  -  -  -  -  -  Expect Password To Be Valid
    ...  -  -  -  -  -  Check Login As Valid
    ...  -  -  -  -  Check Login as Invalid
    ...  -  -  Check Username As Invalid
    ...  -  Click Input
    ...  -  Congratulation Should Pop
    ...  -  Close Popup
    ...  -  Stop Application
