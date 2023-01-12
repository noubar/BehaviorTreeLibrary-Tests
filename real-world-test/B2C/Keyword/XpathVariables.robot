*** Variables ***
########################
### GDSC MAIN WINDOW ###
########################

${GDSC_WINDOW}                                        /Window[@ClassName='GDMFWCN:{F6411F7A-7BD3-4eff-9E8A-B044F2B50A5A}']
${GDSC_WINDOW_TITLEBAR}                               ${GDSC_WINDOW}/TitleBar
#GDSC Subwindow default xpath for settings view
${GDSC_SETTINGS_WINDOW}                               ${GDSC_WINDOW}/Window
${GDSC_SUB_SETTINGS_WINDOW}                           ${GDSC_SETTINGS_WINDOW}/Window

${GDSC_QUESTION}                                      ${GDSC_WINDOW}/TitleBar/Button[1]
${GDSC_MINIMIZE}                                      ${GDSC_WINDOW}/TitleBar/Button[2]
${GDSC_CLOSE}                                         ${GDSC_WINDOW}/TitleBar/Button[3]

${GDSC_SETTINGS}                                      ${GDSC_WINDOW}/Button[@AutomationId='1069']
${GDSC_LOGS}                                          ${GDSC_WINDOW}/Button[@AutomationId='1070']

${GDSC_UPGRADE}                                       ${GDSC_WINDOW}/Button[@AutomationId='1260']

###################
### SYSTEM TRAY ###
###################

${SYSTEM_TRAY}                                        /Pane[@ClassName='Shell_TrayWnd']/Pane[@AutomationId='303']
${SYSTEM_TRAY_GROUPING}                               ${SYSTEM_TRAY}/Button[@AutomationId='1502']
${SYSTEM_TRAY_GD_TRAY_ICON}                           ${SYSTEM_TRAY}/Pane/ToolBar/Button[contains(@Name,'G DATA')]
${NOTIFICATION_OVERFLOW}                              /Pane[@ClassName='NotifyIconOverflowWindow']/ToolBar[@AutomationId='1504']
${NOTIFICATION_OVERFLOW_GD_TRAY_ICON}                 ${NOTIFICATION_OVERFLOW}/Button[contains(@Name,'G DATA')]
