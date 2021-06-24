# AHK Script Creator

Simple-ish python library which generates AHK scripts for remapping your keyboard, with support for an extend layer.

### Example

Swapping `Backspace` with `CapsLock`:

```python
from script_creator import ScriptCreator

sc = ScriptCreator()
sc.add_key('Backspace', 'CapsLock')
sc.add_key('CapsLock', 'CapsLock')

with open('output.ahk', 'w') as file:
    file.write(sc.output())
```

For a more complex example, the following layout is achieved with `example_output.ahk`, which can be generated with `example.py`:

<img src="example.PNG" style="width: 60%; display: block; margin-left: auto; margin-right: auto">

## Notes

* Currently only a single extend layer is supported, although it should be pretty easy to support more, so the feature will probably come soon.

* The `extend` key currently acts as both a temporary and permanant modifier. That is, if you press `Ext` and then another key without releasing extend it will act like and `Fn` key, but if you press and release `Ext` without pressing anything else you'll enter a sort of "Extend Mode" where extend is always pressed (like CapsLock). In the future this will be configurable so you'll be able to choose if you want is temporary, permanant, or both.