from typing import Optional, Tuple, List, Union
from string import ascii_lowercase, ascii_uppercase

####### Utility Functions #######

def _key_code(code: int) -> str:
    return f'SC{hex(code)[2:].zfill(3).upper()}'

def _add_indent(string: str, indent_amount: int) -> str:
    return '\n'.join(indent_amount * ' ' + i for i in string.split('\n'))

####### Key Dictionary #######

NON_SHIFTED_KEYS = {
    # If any key is missing, just add it! Alternatively just send me a message, adding keys is really simple.
    **{x: _key_code(i+0x02) for i, x in enumerate(list('1234567890-='))},
    **{x: _key_code(i+0x10) for i, x in enumerate(list('qwertyuiop[]'))},
    **{x: _key_code(i+0x1E) for i, x in enumerate(list("asdfghjkl;'"))},
    **{x: _key_code(i+0x2C) for i, x in enumerate(list("zxcvbnm,./"))},
    **{i: i for i in [
        'AppsKey', 'NumLock', 'CapsLock', 'LShift', 'RShift', 'LCtrl', 'RCtrl', 'LAlt', 'RAlt',
        'Backspace', 'LWin', 'RWin', 'Tab', 'AppsKey', 'Insert', 'Delete', 'PrintScreen',
        'Up', 'Down', 'Left', 'Right', 'Enter', 'End', 'Home', 'Pgdn', 'Pgup', 'Escape',
        'Volume_Up', 'Volume_Down', 'Media_Next', 'Media_Prev', 'Media_Stop', 'Media_Play_Pause', 
        *map(_key_code, range(0xFFF)), *[f'F{i}' for i in range(22)],
        *[f'Numpad{i}' for i in [*range(10), 'Mult', 'Enter', 'Ins', 'Del', 'Dot', 'Div', 'Sub', 
                                 'Pgdn', 'Pgup', 'Up', 'Down', 'Left', 'Right', 'End', 'Home', 'Clear']],
    ]},
    '\\': 'SC02B',
    '`': 'SC029',
}
SHIFTED_TO_NON_SHIFTED = {
    i[0]: NON_SHIFTED_KEYS[i[1]] for i in zip(
        list('!@#$%^&*()_+<>?:"{}~|'  + ascii_uppercase),
        list("1234567890-=,./;'[]`\\" + ascii_lowercase)
    )
}
SHIFTED_KEYS = {
    i: (['Shift'], NON_SHIFTED_KEYS[SHIFTED_TO_NON_SHIFTED[i]])
    for i in '!@#$%^&*()_+<>?:"{}|~' + ascii_uppercase
}
CTRL_KEYS = {
    'Undo':  (['Ctrl'], 'z'),
    'Redo':  (['Ctrl'], 'y'),
    'Cut':   (['Ctrl'], 'x'),
    'Copy':  (['Ctrl'], 'c'),
    'Paste': (['Ctrl'], 'v'),
    'Find':  (['Ctrl'], 'f'),
    'Save':  (['Ctrl'], 's'),
}
KEYS = {**SHIFTED_KEYS, **NON_SHIFTED_KEYS, **CTRL_KEYS}

####### Utility Types #######

class AhkFunction:
    """Keys bound to an AhkFunction will call the relevant functions on key down/up"""
    def __init__(self, name: str):
        """self.name = name"""
        self.name = name
    
    def __str__(self) -> str:
        """return f'{self.name}()'"""
        return f'{self.name}()'

class RawInput:
    """Keys bound to RawInput will just write the `self.value` string as their output."""
    def __init__(self, value: str):
        """self.value = value"""
        assert '\n' not in value # if you want multiple lines use `AhkFunction` instead.
        self.value = value
    
    def __str__(self) -> str:
        """return self.name.__repr__()"""
        return self.value.__repr__()

EllipsisType = type(...)
NoneType = type(None)
KeynameWithModifiers = Tuple[List[str], str]
Keyname = Union[str, KeynameWithModifiers]
Mapping = Union[Keyname, AhkFunction, RawInput, NoneType]

####### Keycode Utility functions #######

DOWN, UP = True, False

def _key_to_str(keyname: Keyname, key_down: Optional[bool]) -> str:
    actual_keyname = KEYS[keyname]
    if isinstance(actual_keyname, str):
        if key_down is None:
            return actual_keyname
        return f'{{{actual_keyname}{"" if key_down else " up"}}}'
    assert key_down is not None
    assert isinstance(actual_keyname, tuple)
    assert len(actual_keyname) == 2
    modifiers, key = actual_keyname
    assert isinstance(key, str)
    assert isinstance(modifiers, list)
    assert all(isinstance(i, str) for i in modifiers)
    if not key_down:
        return _key_to_str(key, key_down)
    return ''.join(f'{{{i} Down}}' for i in modifiers) + _key_to_str(key, key_down) \
           + ''.join(f'{{{i} up}}' for i in reversed(modifiers))

####### Main Class, the bulk of the logic is here #######

class ScriptCreator:
    NOOP_FUNCTION_NAME = '__noop'

    def __init__(self, use_winkey_shortcuts: bool = False):
        """
        if `use_winkey_shortcuts == False`, then any shortcuts using LWin will temporarily suspend the script.
        The reason this is wanted is because some winkey shortcuts (like Win+L) can't be overriden.
        """
        self._output = ""
        self._extend_key = ""
        self._when_extend_on = ""
        self._when_extend_off = ""
        self._when_init = ""
        self._noop_function_used = False
        self._use_winkey_shortcuts = use_winkey_shortcuts

    def set_extend_key(self, key: str):
        """Set the key which activates the first extend layer"""
        self._extend_key = key
    
    def set_when_extend_on(self, code: str):
        """`code` - raw AHK code to be executed when extend is activated permanantly"""
        self._when_extend_on = code
    
    def set_when_extend_off(self, code: str):
        """`code` - raw AHK code to be executed when extend is disabled"""
        self._when_extend_off = code
    
    def set_when_init(self, code: str):
        """`code` - raw AHK code to be executed when the script is first run"""
        self._when_init = code
    
    def add_to_init(self, code: str):
        """Add more code to the init phase (see `set_when_init()`)"""
        self._when_init += '\n' + code

    def add_raw(self, code: str):
        """Add raw AHK code at the current output location"""
        self._output += '\n' + code

    def add_raw_to_start(self, code: str):
        """Add raw AHK code at the output's start"""
        self._output = code + '\n' + self._output 

    def add_comment(self, comment: str):
        """Add a comment in the AHK file at the current output location"""
        self._output += f"\n;; {comment}\n"
    
    def disable_key(self, key: str):
        """Disable a key. Equivalent to `add_key(key, None)`"""
        self.add_key(key, None)

    def add_function(self, name: str, on_down: str, on_up: str = '') -> AhkFunction:
        """
        Creates and returns an AHK function which can be bound to different keys.
        `name` - function's name.
        `on_down` / `on_up` - raw AHK code to execute on key down/up.
        """
        assert '_up' not in name and '_down' not in name
        self.add_raw(name + '_down(){\n' + _add_indent(on_down, 4) + '\n}')
        self.add_raw(name + '_up(){\n' + _add_indent(on_up, 4) + '\n}')
        return AhkFunction(name)

    def add_key(self,
        key            : Keyname,
        normal         : Union[Mapping, EllipsisType] = ...,
        shifted        : Union[Mapping, EllipsisType] = ...,
        extended       : Union[Mapping, EllipsisType] = ..., 
        shift_extended : Union[Mapping, EllipsisType] = ..., 
        comment        : Optional[str] = None
    ):
        """
        Create binding for `key`.
            key - The key to bind to.
            normal - Key to be sent when no modifier is pressed.
            shifted - Key to be sent when shift is down.
            extended - Key to be sent when extend is down.
            shift_extended - Key to be sent when extend and shift are down.
            comment - Comment to add to the AHK script before the keybinding.
        
        TODO - currently only the first extend layer is supported.
        """

        if key not in NON_SHIFTED_KEYS:
            if key in KEYS:
                raise Exception(f"Key {key.__repr__()} cannot be bound to.\nNOTE - keys are case sensitive!")
            raise Exception(f"Key {key.__repr__()} does not exist.\nNOTE - keys are case sensitive!")

        if shift_extended is not ... and extended is ...:
            extended = normal
        
        if normal is ...: normal = key
        if normal is None:
            if shifted is ...: shifted = None
            if extended is ...: extended = None
        if extended is None:
            if shift_extended is ...: shift_extended = None

        if comment: self.add_raw(f';; {comment}')
        self.add_raw(f';; {key} -> {" or ".join(map(str, filter(None, [normal, shifted, extended, shift_extended])))}')

        key = _key_to_str(key, None)

        if not any([normal, shifted, extended, shift_extended]):
            self.add_raw(f"{key}::return")
            return

        # On key down:
        self.add_raw        (f'$*{key}::')
        if shifted is not ... or shift_extended is not ...:
            self.add_raw    (f'    {key}_shifted := GetKeyState("Shift")')
        if extended is not ...:
            self.add_raw    (f'    {key}_extended := is_extend_mode_on')
        self.add_raw        (f'    SetKeyDelay -1')
        if extended is not ...:
            self.add_raw    (f'    if {key}_extended {{')
            if shift_extended is not ...:
                self.add_raw(f'        if {key}_shifted {{')
                self.add_raw(f'            SendInput {{Blind}}{{Shift Up}}')
                self.add_raw(f'            {self._send_input(shift_extended, DOWN)}')
                self.add_raw(f'            SendInput {{Blind}}{{Shift Down}}')
                self.add_raw(f'        }}')
                
                self.add_raw(f'        else')
                self.add_raw(f'            {self._send_input(extended, DOWN)}')
            else:
                self.add_raw(f'        {self._send_input(extended, DOWN)}')
            self.add_raw    (f'        was_used := true')
            self.add_raw    (f'    }}')
            if shifted is not ...:
                self.add_raw(f'    else if {key}_shifted {{')
                self.add_raw(f'        SendInput {{Blind}}{{Shift Up}}')
                self.add_raw(f'        {self._send_input(shifted, DOWN)}')
                self.add_raw(f'        SendInput {{Blind}}{{Shift Down}}')
                self.add_raw(f'    }}')
                
            self.add_raw    (f'    else')
            self.add_raw    (f'        {self._send_input(normal, DOWN)}')
            self.add_raw    (f'return')
        elif shifted is not ...:
            self.add_raw    (f'    if {key}_shifted {{')
            self.add_raw    (f'        SendInput {{Blind}}{{Shift Up}}')
            self.add_raw    (f'        {self._send_input(shifted, DOWN)}')
            self.add_raw    (f'        SendInput {{Blind}}{{Shift Down}}')
            self.add_raw    (f'    }}')
            
            self.add_raw    (f'    else')
            self.add_raw    (f'        {self._send_input(normal, DOWN)}')
            self.add_raw    (f'return')
        else:
            self.add_raw    (f'    {self._send_input(normal, DOWN)}')
            self.add_raw    (f'return')
        
        # On key up:
        self.add_raw        (f'$*{key} up::')
        self.add_raw        (f'    SetKeyDelay -1')
        if extended is not ...:
            if shift_extended is not ...:
                self.add_raw(f'    if {key}_extended {{')
                self.add_raw(f'        if {key}_shifted')
                self.add_raw(f'            {self._send_input(shift_extended, UP)}')
                self.add_raw(f'        else')
                self.add_raw(f'            {self._send_input(extended, UP)}')
                self.add_raw(f'    }}')
            else:
                self.add_raw(f'    if {key}_extended')
                self.add_raw(f'        {self._send_input(extended, UP)}')
            if shifted is not ...:
                self.add_raw(f'    else if {key}_shifted')
                self.add_raw(f'        {self._send_input(shifted, UP)}')
            self.add_raw    (f'    else')
            self.add_raw    (f'        {self._send_input(normal, UP)}')
            self.add_raw    (f'return')
        elif shifted is not ...:
            self.add_raw    (f'    if {key}_shifted')
            self.add_raw    (f'        {self._send_input(shifted, UP)}')
            self.add_raw    (f'    else')
            self.add_raw    (f'        {self._send_input(normal, UP)}')
            self.add_raw    (f'return')
        else:
            self.add_raw    (f'    {self._send_input(normal, UP)}')
            self.add_raw    (f'return')

        self.add_raw('') # add empty line
    
    def output(self) -> str:
        """Returns the final AHK script"""
        if self._extend_key == "":
            raise Exception("Extend key was not set!")
        return f"""\
;; Init
is_extend_mode_on := false
{self._when_init}
""" + ("" if self._use_winkey_shortcuts else f"""
;; We can't override ALL winkey shortcuts, so might as well be consistent and not override any of them.
$*LWin::
    SetKeyDelay -1
    SendInput {{Blind}}{{LWin DownTemp}}
    Suspend On
return
$*LWin up::
    Suspend Off
    SetKeyDelay -1
    SendInput {{Blind}}{{LWin Up}}
return""") + f"""

;; REGISTER EXTEND KEY
$*{_key_to_str(self._extend_key, None)}::
    {self._send_input(self._extend_key, UP)}
    is_extend_mode_on := true
    was_used := false
return
$*{_key_to_str(self._extend_key, None)} Up::
    if was_used or GetKeyState("NumLock", "T") {{
        is_extend_mode_on := false
        {self._when_extend_off}
    }}
    else {{
        {self._when_extend_on}
    }}
return

{self._output}
""" + ('' if not self._noop_function_used else f"""
{ScriptCreator.NOOP_FUNCTION_NAME}() {{
    ;; Do nothing.
}}
""")

    def _send_input(self, mapping: Mapping, key_down: bool) -> str:
        if mapping is None:
            self._noop_function_used = True
            return f'{ScriptCreator.NOOP_FUNCTION_NAME}()'
        if isinstance(mapping, RawInput):
            return f'Send, {mapping.value}' if key_down else 'return'
        if isinstance(mapping, AhkFunction):
            return f'{mapping.name}{"_down" if key_down else "_up"}()'
        return f'SendInput {{Blind}}{_key_to_str(mapping, key_down)}'

def main():
    raise Exception("TODO - write example usage")

if __name__ == "__main__":
    main()
