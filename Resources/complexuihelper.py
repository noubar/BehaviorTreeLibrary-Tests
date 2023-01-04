from tkinter import E
import uiautomation as auto
auto.uiautomation.SetGlobalSearchTimeout(5)
from os import error
auto.Logger.SetLogFile('')

class complexuihelper:

    def __init__(self):
        self.window = None
        self.table = None

    def _connect_to_app(self):
        self.window = auto.WindowControl(searchDepth=1, Name='ComplexPuzzle', AutomationId= "WPF_COMPLEX_PUZZLE")
        self.pane = self.window.PaneControl(searchDepth=1, ClassName='ScrollViewer')

    def _select_item(self,item):
        for i in range(5):
            item.GetSelectionItemPattern().Select()
            if item.GetSelectionItemPattern().IsSelected:
                break

    def _get_states_table(self):
        table = []
        datagrid = self.pane.GroupControl(searchDepth=1, Name='Puzzle').DataGridControl(searchDepth=1, AutomationId= "PUZZLE")
        for i in range(1,9):
            item = datagrid.DataItemControl(searchDepth=1,foundIndex=i)
            row_vals = []
            for j in range(1,9):
                custom = item.CustomControl(searchDepth=1, ClassName='DataGridCell', foundIndex=j)
                checkbox = custom.CheckBoxControl(searchDepth=1, ClassName='CheckBox')
                state = checkbox.GetTogglePattern().ToggleState
                row_vals.append(state)
            table.append(row_vals)
        self.table = table

    def expect_four_in_row(self):
        self._connect_to_app()
        self._get_states_table()
        for row in self.table:
            for i in range(5):
                if row[i+0] == 1 and row[i+1] == 1 and row[i+2] == 1 and row[i+3] == 1:
                    return None
        raise error("There is no four in row.")

    def expect_four_in_column(self):
        self._connect_to_app()
        self._get_states_table()
        for i in range(len(self.table)):
            for j in range(5):
                if self.table[j+0][i] == 1 and self.table[j+1][i] == 1 and self.table[j+2][i] == 1 and self.table[j+3][i] == 1:
                    return None
        raise error("There is no four in column.")

    def expect_four_in_positive_diagonal(self):
        self._connect_to_app()
        self._get_states_table()
        for i in range(0,5):
            for j in range(3,8):
                if self.table[i + 3][j - 3] == 1 and self.table[i + 2][j - 2] == 1 and self.table[i + 1][j - 1] == 1 and self.table[i][j] == 1:
                    return None
        raise error("There is no four in positive diagonal.")

    def expect_four_in_negative_diagonal(self):
        self._connect_to_app()
        self._get_states_table()
        for i in range(3,8):
            for j in range(3,8):
                if self.table[j - 3][i - 3] == 1 and self.table[j - 2][i - 2] == 1 and self.table[j - 1][i - 1] == 1 and self.table[j][i] == 1:
                    return None
        raise error("There is no four in negative diagonal.")
    
    def check_table_as_valid(self):
        self._connect_to_app()
        radiobutton = self.pane.RadioButtonControl(searchDepth=1, Name='TableValid', AutomationId= "TableValid", foundIndex=1)
        self._select_item(radiobutton)
    
    def check_table_as_invalid(self):
        self._connect_to_app()
        radiobutton = self.pane.RadioButtonControl(searchDepth=1, Name='TableInvalid', AutomationId= "TableInvalid", foundIndex=1)
        self._select_item(radiobutton)

    def expect_username_to_be_valid(self):
        self._connect_to_app()
        text = self.pane.EditControl(searchDepth=1, AutomationId='USERNAME_TEXTBOX', foundIndex=1).GetValuePattern().Value.lower()
        if text == 'valid':
            return None
        raise error("Username is invalid")

    def expect_password_to_be_valid(self):
        self._connect_to_app()
        text = self.pane.EditControl(searchDepth=1, AutomationId='PASSWORD_TEXTBOX', foundIndex=1).GetValuePattern().Value.lower()
        if text == 'valid':
            return None
        raise error("Password is invalid")

    def check_login_as_valid(self):
        self._connect_to_app()
        radiobutton = self.pane.RadioButtonControl(searchDepth=1, Name='LoginValid', AutomationId= "LoginValid", foundIndex=1)
        self._select_item(radiobutton)

    def check_login_as_invalid(self):
        self._connect_to_app()
        radiobutton = self.pane.RadioButtonControl(searchDepth=1, Name='LoginInvalid', AutomationId= "LoginInvalid", foundIndex=1)
        self._select_item(radiobutton)

    def check_username_as_invalid(self):
        self._connect_to_app()
        radiobutton = self.pane.RadioButtonControl(searchDepth=1, Name='UsernameInvalid', AutomationId= "UsernameInvalid", foundIndex=1)
        self._select_item(radiobutton)

    def check_username_as_invalid(self):
        self._connect_to_app()
        radiobutton = self.pane.RadioButtonControl(searchDepth=1, Name='UsernameInvalid', AutomationId= "UsernameInvalid", foundIndex=1)
        self._select_item(radiobutton)

    def click_input(self):
        self._connect_to_app()
        inputButton = self.pane.ButtonControl(searchDepth=1, Name='input', AutomationId= "COMPLEX_BUTTON", foundIndex=1)
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