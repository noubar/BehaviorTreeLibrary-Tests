*** Settings ***
Documentation   This is a keyword file used for the B2C product.
...             It should be imported in the settings section of the respective test suite files.
...             It contains all keywords that supports TrayIcon tests and Tray related operations.

Library    BehaviorTreeLibrary

*** Keywords ***
Open GDSC By Tray
    [Documentation]  This keyword opens the Tray Context Menu.
    ...
    Is Tray Icon NotGrouped
    Close If Notification Tray Popups
    IF  ${NotGrouped}==True
        Open GDSC By System Tray
    ELSE
        Open GDSC By Notification Overflow
    END

Open GDSC By Tray BT
    [Documentation]  This keyword opens the Tray Context Menu. Best Approach
    ...
    Is Tray Icon NotGrouped BT  # <-- this keyword is rewritten using BT
    Close If Notification Tray Popups BT  # <-- this keyword is rewritten using BT
    IF  ${NotGrouped}==True
        Open GDSC By System Tray
    ELSE
        Open GDSC By Notification Overflow
    END

Is Tray Icon NotGrouped
    [Documentation]  This keyword checks whether the tray icon of gdata is in notification overflow from windows or in toolbar.
    ...                                 Sets a suite variable if it has not been set before to determine whether the icon is grouped or not.
    ...
    ${_notGroupVarExist}                Run Keyword And Return Status       Variable Should Exist  ${NotGrouped}
    Return From Keyword If              ${_notGroupVarExist}
    ${_exists_sys_tray}                 Run Keyword And Return Status       Wait Until Keyword Succeeds
    ...  10x  100ms                     Element Should Exist                ${SYSTEM_TRAY_GD_TRAY_ICON}
    IF  ${_exists_sys_tray} == ${True}
        ${NotGrouped}                   Set Variable                        ${True}
        Set Global Variable              ${NotGrouped}
        Return From Keyword
    END
    ${_status}                          Run Keyword And Return Status
    ...                                 Element Should Exist                ${SYSTEM_TRAY_GROUPING}
    IF  ${_status} == ${False}
        Fail                            msg="Tray icon is not present on sys tray and overflow area does not exist!"
    END
    Open Notification Overflow Area
    ${_exists_not_ovfl}                 Run Keyword And Return Status       Wait Until Keyword Succeeds
    ...  15x  200ms                     Element Should Exist                ${NOTIFICATION_OVERFLOW_GD_TRAY_ICON}
    IF  ${_exists_not_ovfl} == ${True}
        ${NotGrouped}                   Set Variable                        ${False}
        Set Global Variable              ${NotGrouped}
        Close Notification Overflow Area
        Return From Keyword
    END
    IF  ${_exists_sys_tray} == ${False} and ${_exists_not_ovfl} == ${False}
        Fail                            msg="G DATA tray icon could not be found."
    END

Is Tray Icon NotGrouped BT
    [Documentation]  This keyword checks whether the tray icon of gdata is in notification overflow from windows or in toolbar.
    ...                                 Sets a suite variable if it has not been set before to determine whether the icon is grouped or not.
    ...
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


Tray Icon Should Not Be Grouped
    Wait Until Keyword Succeeds  10x  100ms  Element Should Exist  ${SYSTEM_TRAY_GD_TRAY_ICON}

Check If Tray Icon Exists
    [Documentation]  Checks if Client tray icon exists.
    ...
    ${_exists_sys_tray}                 Run Keyword And Return Status       Wait Until Keyword Succeeds
    ...  10x  100ms                     Element Should Exist                ${SYSTEM_TRAY_GD_TRAY_ICON}
    Open Notification Overflow Area
    ${_exists_not_ovfl}                 Run Keyword And Return Status       Wait Until Keyword Succeeds
    ...  10x  100ms                     Element Should Exist                ${NOTIFICATION_OVERFLOW_GD_TRAY_ICON}
    IF  '${_exists_sys_tray}'=='${false}' and '${_exists_not_ovfl}'=='${false}'
        Fail                            msg="G DATA tray icon could not be found."
    END

Open GDSC By System Tray
    [Documentation]  This keyword opens the GDSC window by system tray icon.
    ...
    Close If Notification Tray Popups
    Double Click Open               ${SYSTEM_TRAY_GD_TRAY_ICON}           ${GDSC_WINDOW}           msg="GDSC Window could not be opened via Tray."

Open GDSC By Notification Overflow
    [Documentation]  This keyword opens the GDSC window by system tray icon which is hidden in notification overflow from windows.
    ...
    Open Notification Overflow Area
    ${_status}                      Run Keyword And Return Status
    ...        Double Click Open    ${NOTIFICATION_OVERFLOW_GD_TRAY_ICON}  ${GDSC_WINDOW}    ignoreIfAlreadyOpen=True
    IF  ${_status}==False
        Close Notification Overflow Area
        Fail                        msg="GDSC Window could not be opened via Tray in Notification Overflow."
    END

# As you can see this implementation did not improve the origin code
Open GDSC By Notification Overflow BT
    [Documentation]  This keyword opens the GDSC window by system tray icon which is hidden in notification overflow from windows.
    ...
    Open Notification Overflow Area
    One Should Pass
    ...  -  Double Click Open    ${NOTIFICATION_OVERFLOW_GD_TRAY_ICON}  ${GDSC_WINDOW}    ignoreIfAlreadyOpen=True
    ...  -  All Should Pass
    ...  -  -  Close Notification Overflow Area
    ...  -  -  Fail    msg="GDSC Window could not be opened via Tray in Notification Overflow."