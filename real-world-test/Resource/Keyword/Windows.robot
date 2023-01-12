*** Keywords ***
Close If Notification Tray Popups
    [Documentation]                     This keyword will wait if a Notification Tray from Windows pop up clicks on the close button or right arrow button.
    ...                                 Gdatas WebProtection extension installation popup also has the same xpath and will be closed in the same way.
    ...                                 This means this keyword can be used for both
    ...
    ${_popupVisible}                    Run Keyword And Return Status  Wait Until Keyword Succeeds  5x  10ms
    ...                                 Element Should Exist   ${NOTIFICATION_POPUP_WINDOW}
    ${_dismissButton}                   Set Variable           ${False}
    IF  ${_popupVisible}==${True}
        ${_dismissButton}   Run Keyword And Return Status
        ...   Wait Until Keyword Succeeds  2x  10ms    Element Should Exist  ${NOTIFICATION_POPUP_DISMISS}
    END
    IF  ${_dismissButton}==${True}
        Click Close  ${NOTIFICATION_POPUP_DISMISS}  ${NOTIFICATION_POPUP_WINDOW}  ${NOTIFICATION_POPUP_DISMISS}  ignoreIfAlreadyClosed=True
    ELSE IF  ${_popupVisible}==${True}
        Click Close  ${NOTIFICATION_POPUP_WINDOW}   ignoreIfAlreadyClosed=True
    END
    ${_backup}  Run Keyword And Return Status  Element Should Exist   ${NOTIFICATION_POPUP_CLOSE}
    IF  ${_backup}==${True}
        Click Close  ${NOTIFICATION_POPUP_CLOSE}  clickCloseWait=10ms  ignoreIfAlreadyClosed=True 
    END

Close If Notification Tray Popups BT
    [Documentation]                     This keyword will wait if a Notification Tray from Windows pop up clicks on the close button or right arrow button.
    ...                                 Gdatas WebProtection extension installation popup also has the same xpath and will be closed in the same way.
    ...                                 This means this keyword can be used for both
    ...
    One Should Pass
    ...  -  Wait Until Keyword Succeeds  5x  10ms  Element Should Not Exist  ${NOTIFICATION_POPUP_WINDOW}
    ...  -  All Should Pass
    ...  -  -  Wait Until Keyword Succeeds  2x  10ms  Element Should Exist  ${NOTIFICATION_POPUP_DISMISS}
    ...  -  -  Click Close  ${NOTIFICATION_POPUP_DISMISS}  ${NOTIFICATION_POPUP_WINDOW}  ${NOTIFICATION_POPUP_DISMISS}  ignoreIfAlreadyClosed=True
    ...  -  Click Close  ${NOTIFICATION_POPUP_WINDOW}   ignoreIfAlreadyClosed=True
    One Should Pass
    ...  -  Element Should Not Exist  ${NOTIFICATION_POPUP_CLOSE}
    ...  -  Click Close  ${NOTIFICATION_POPUP_CLOSE}  clickCloseWait=10ms  ignoreIfAlreadyClosed=True

Close Notification Overflow Area
    [Documentation]                     This keyword closes the Notification Overflow Area from Windows.
    ...
    Close If Notification Tray Popups
    Click Close  ${SYSTEM_TRAY_GROUPING}  ${NOTIFICATION_OVERFLOW}  clickCloseWait=10ms  ignoreIfAlreadyClosed=True
    ...          msg="Group Icon could not be clicked or found in system tray!"

Open Notification Overflow Area
    [Documentation]                     This keyword opens the Notification Overflow Area from Windows.
    ...
    Close If Notification Tray Popups
    Click Open  ${SYSTEM_TRAY_GROUPING}  ${NOTIFICATION_OVERFLOW}  clickOpenWait=10ms  ignoreIfAlreadyOpen=True
    ...         msg="Group Icon could not be clicked or found in system tray!"

