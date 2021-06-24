from script_creator import AhkFunction, RawInput, ScriptCreator

OUTPUT_FILE_PATH = 'example_output.ahk'

def main():
    c = ScriptCreator()
    
    c.set_extend_key("RAlt")
    c.set_when_init("SetNumLockState, Off")
    c.add_to_init("SetScrollLockState, Off")
    c.set_when_extend_on("SetNumLockState, On")
    c.set_when_extend_off("SetNumLockState, Off")

    c.add_comment("NUMBERS ROW")
    c.add_key('`', 'CapsLock')
    c.add_key('1', 'AppsKey')
    c.add_key('2', '@', '@')
    c.add_key('3', '#', '#')
    c.add_key('4', '$', '$')
    c.add_key('5', '%', '%')
    c.add_key('6', '^', '^')
    c.add_key('7', '&', '|')
    c.add_key('8', '*', '/')
    c.add_key('9', '(', '{')
    c.add_key('0', ')', '}')
    c.add_key('-', '[', '<')
    c.add_key('=', ']', '>')
    c.add_key('Backspace', '`')

    c.add_comment('TOP ROW')
    # c.add_key('Tab', 'Tab')
    c.add_key('q', 'Delete')
    c.add_key('w', 'q', ..., 'Save')
    c.add_key('e', 'w', ..., ':', ':')
    c.add_key('r', 'f', ..., ';', ';')
    c.add_key('t', 'p', ..., '7', RawInput('±'))
    c.add_key('y', 'g', ..., '8', '-')
    c.add_key('u', 'j', ..., '9', '+')
    c.add_key('i', 'l', ..., 'Pgup')
    c.add_key('o', 'u', ..., 'Home')
    c.add_key('p', 'y', ..., 'Up')
    c.add_key('[', '=', ..., 'End')
    c.add_key(']', '-', '!')
    # c.add_key('\\', '\\')

    c.add_comment('MIDDLE ROW')
    c.add_key('CapsLock', 'Enter')
    c.add_key('a', 'Backspace')
    c.add_key('s', 'a', ..., 'Redo')
    c.add_key('d', 'r', ..., ',', ',')
    c.add_key('f', 's', ..., '.', '.')
    c.add_key('g', 't', ..., '4', 'd')
    c.add_key('h', 'd', ..., '5', 'e')
    c.add_key('j', 'h', ..., '6', 'f')
    c.add_key('k', 'n', ..., 'Pgdn')
    c.add_key('l', 'e', ..., 'Left')
    c.add_key(';', 'i', ..., 'Down')
    c.add_key("'", 'o', ..., 'Right')
    c.add_key('Enter', "'")

    c.add_comment('BOTTOM ROW')
    c.add_key('z', 'z', ..., 'Undo')
    c.add_key('x', 'x', ..., 'Cut')
    c.add_key('c', 'c', ..., 'Copy')
    c.add_key('v', 'v', ..., 'Paste')
    c.add_key('b', 'b', ..., '1', 'a')
    c.add_key('n', '_', '_', '2', 'b')
    c.add_key('m', 'k', ..., '3', 'c')
    c.add_key(',', 'm', ..., '0', 'e')
    c.add_key('.', ',', ':', 'x', 'X')
    c.add_key('/', '.', ';', 'b', 'B')
    c.add_key('RShift', '/', '?', 'o', 'O')
    
    c.add_comment('SPACEBAR ROW')
    c.add_key('RWin', 'Escape')
    c.disable_key('AppsKey') # should be Fn
    c.disable_key('RCtrl') # should be Fn2

    c.add_comment('DISABLE NUMLOCK')
    c.disable_key('NumLock')
    c.add_key('NumpadDel',   'NumpadDot')
    c.add_key('NumpadIns',   'Numpad0')
    c.add_key('NumpadEnd',   'Numpad1')
    c.add_key('NumpadDown',  'Numpad2')
    c.add_key('NumpadPgdn',  'Numpad3')
    c.add_key('NumpadLeft',  'Numpad4')
    c.add_key('NumpadClear', 'Numpad5')
    c.add_key('NumpadRight', 'Numpad6')
    c.add_key('NumpadHome',  'Numpad7')
    c.add_key('NumpadUp',    'Numpad8')
    c.add_key('NumpadPgup',  'Numpad9')

    c.add_function('insert_unicode', '''\
InputBox, hex, Enter hex, hex
Send {U+%hex%}
return
''')

    c.add_function('copy_numbers', '''\
InputBox, range_start, Enter range, range start (inclusive)
InputBox, range_end, Enter range, range end (inclusive)
out := ""
i := range_start
While i <= range_end {
    out .= i . "`n"
    i += 1
}
Clipboard = %out%
''')

    c.add_raw('''
is_script_on := true
$Delete::
$Escape::
    if false {
        ;; stops Escape/Delete from triggering when script is suspended
    }
$ScrollLock::
    Suspend
    is_script_on := not is_script_on
    if is_script_on
        SetScrollLockState, On
    else
        SetScrollLockState, Off
return
''')

    with open(OUTPUT_FILE_PATH, 'w') as file:
        file.write(c.output())

if __name__ == "__main__":
    main()
