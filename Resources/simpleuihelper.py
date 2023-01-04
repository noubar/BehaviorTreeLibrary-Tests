from tkinter import E
import uiautomation as auto
auto.uiautomation.SetGlobalSearchTimeout(15)
from os import error
auto.Logger.SetLogFile('')

class simpleuihelper:

    def __init__(self):
        self.window = None

    def _connect_to_app(self):
        if not self.window:
            self.window = auto.WindowControl(searchDepth=1, Name='SimplePuzzle', AutomationId= "WPF_SIMPLE_PUZZLE")

    def _select_item(self,item):
        for i in range(5):
            item.GetSelectionItemPattern().Select()
            if item.GetSelectionItemPattern().IsSelected:
                break

    def click_input(self):
        self._connect_to_app()
        inputButton = self.window.TabControl(searchDepth=1).ButtonControl(searchDepth=2, Name='input', foundIndex=1)
        try:
            inputButton.Click()
        except Exception:
            raise error("Input button is not there.")

    def Congratulation_should_pop(self):
        self._connect_to_app()
        text = self.window.WindowControl(searchDepth=1, ClassName='#32770',foundIndex=1).TextControl(searchDepth=1, AutomationId= "65535",foundIndex=1)
        try:
            if text.Name == "Congratulation":
                return None
            else:
                raise error("Popup do not contain Congratulation.")
        except Exception:
            raise error("Popup of Congratulation did not apear.")

    def close_popup(self):
        self._connect_to_app()
        okButton = self.window.WindowControl(searchDepth=1, ClassName='#32770',foundIndex=1).ButtonControl(searchDepth=1, AutomationId= "2",foundIndex=1)
        try:
            okButton.Click()
        except Exception:
            raise error("Popup of Congratulation is not there.")

    def select_stage1(self):
        self._connect_to_app()
        stageTab = self.window.TabControl(searchDepth=1).TabItemControl(searchDepth=1,foundIndex=1)
        self._select_item(stageTab)

    def select_stage2(self):
        self._connect_to_app()
        stageTab = self.window.TabControl(searchDepth=1).TabItemControl(searchDepth=1,foundIndex=2)
        self._select_item(stageTab)

    def select_stage3(self):
        self._connect_to_app()
        stageTab = self.window.TabControl(searchDepth=1).TabItemControl(searchDepth=1,foundIndex=3)
        self._select_item(stageTab)

    def switch_username_and_password(self):
        self._connect_to_app()
        user = self.window.TabControl(searchDepth=1).TabItemControl(searchDepth=1,foundIndex=1).EditControl(searchDepth=1,AutomationId="USERNAME_TEXTBOX",foundIndex=1)
        userVal = user.GetValuePattern().Value
        password = self.window.TabControl(searchDepth=1).TabItemControl(searchDepth=1,foundIndex=1).EditControl(searchDepth=1,AutomationId="PASSWORD_TEXTBOX",foundIndex=1)
        passVal = password.GetValuePattern().Value
        password.GetValuePattern().SetValue(userVal)
        user.GetValuePattern().SetValue(passVal)

    def copy_flag(self):
        self._connect_to_app()
        flag = self.window.WindowControl(searchDepth=1, ClassName='#32770',foundIndex=1).TextControl(searchDepth=1,foundIndex=1).Name
        return flag
    
    def enter_first_solution(self):
        self._connect_to_app()
        solCheck = self.window.TabControl(searchDepth=1).TabItemControl(searchDepth=1,foundIndex=2).DataGridControl(searchDepth=1,foundIndex=1).DataItemControl(searchDepth=1,foundIndex=1).CustomControl(searchDepth=1,foundIndex=2).CheckBoxControl(searchDepth=1,foundIndex=1)
        putCheck = self.window.TabControl(searchDepth=1).TabItemControl(searchDepth=1,foundIndex=2).DataGridControl(searchDepth=1,foundIndex=1).DataItemControl(searchDepth=1,foundIndex=1).CustomControl(searchDepth=1,foundIndex=1).CheckBoxControl(searchDepth=1,foundIndex=1)
        if solCheck.GetTogglePattern().ToggleState:
            putCheck.GetTogglePattern().Toggle()

    def enter_second_solution(self):
        self._connect_to_app()
        solCheck = self.window.TabControl(searchDepth=1).TabItemControl(searchDepth=1,foundIndex=2).DataGridControl(searchDepth=1,foundIndex=1).DataItemControl(searchDepth=1,foundIndex=2).CustomControl(searchDepth=1,foundIndex=2).CheckBoxControl(searchDepth=1,foundIndex=1)
        putCheck = self.window.TabControl(searchDepth=1).TabItemControl(searchDepth=1,foundIndex=2).DataGridControl(searchDepth=1,foundIndex=1).DataItemControl(searchDepth=1,foundIndex=2).CustomControl(searchDepth=1,foundIndex=1).CheckBoxControl(searchDepth=1,foundIndex=1)
        if solCheck.GetTogglePattern().ToggleState:
            putCheck.GetTogglePattern().Toggle()

    def enter_third_solution(self):
        self._connect_to_app()
        solCheck = self.window.TabControl(searchDepth=1).TabItemControl(searchDepth=1,foundIndex=2).DataGridControl(searchDepth=1,foundIndex=1).DataItemControl(searchDepth=1,foundIndex=3).CustomControl(searchDepth=1,foundIndex=2).CheckBoxControl(searchDepth=1,foundIndex=1)
        putCheck = self.window.TabControl(searchDepth=1).TabItemControl(searchDepth=1,foundIndex=2).DataGridControl(searchDepth=1,foundIndex=1).DataItemControl(searchDepth=1,foundIndex=3).CustomControl(searchDepth=1,foundIndex=1).CheckBoxControl(searchDepth=1,foundIndex=1)
        if solCheck.GetTogglePattern().ToggleState:
            putCheck.GetTogglePattern().Toggle()

    def enter_flags(self,flag1:str,flag2:str):
        self._connect_to_app()
        self.window.TabControl(searchDepth=1).TabItemControl(searchDepth=1,foundIndex=3).EditControl(searchDepth=1,AutomationId="FLAG1_TEXTBOX",foundIndex=1).GetValuePattern().SetValue(flag1)
        self.window.TabControl(searchDepth=1).TabItemControl(searchDepth=1,foundIndex=3).EditControl(searchDepth=1,AutomationId="FLAG2_TEXTBOX",foundIndex=1).GetValuePattern().SetValue(flag2)