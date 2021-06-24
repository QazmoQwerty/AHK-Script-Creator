;; Init
is_extend_mode_on := false
SetNumLockState, Off
SetScrollLockState, Off

;; We can't override ALL winkey shortcuts, so might as well be consistent and not override any of them.
$*LWin::
    SetKeyDelay -1
    SendInput {Blind}{LWin DownTemp}
    Suspend On
return
$*LWin up::
    Suspend Off
    SetKeyDelay -1
    SendInput {Blind}{LWin Up}
return

;; REGISTER EXTEND KEY
$*RAlt::
    SendInput {Blind}{RAlt up}
    is_extend_mode_on := true
    was_used := false
return
$*RAlt Up::
    if was_used or GetKeyState("NumLock", "T") {
        is_extend_mode_on := false
        SetNumLockState, Off
    }
    else {
        SetNumLockState, On
    }
return


;; NUMBERS ROW

;; ` -> CapsLock or Ellipsis or Ellipsis or Ellipsis
$*SC029::
    SetKeyDelay -1
    SendInput {Blind}{CapsLock}
return
$*SC029 up::
    SetKeyDelay -1
    SendInput {Blind}{CapsLock up}
return

;; 1 -> AppsKey or Ellipsis or Ellipsis or Ellipsis
$*SC002::
    SetKeyDelay -1
    SendInput {Blind}{AppsKey}
return
$*SC002 up::
    SetKeyDelay -1
    SendInput {Blind}{AppsKey up}
return

;; 2 -> @ or @ or Ellipsis or Ellipsis
$*SC003::
    SC003_shifted := GetKeyState("Shift")
    SetKeyDelay -1
    if SC003_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{Shift Down}{SC003}{Shift up}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{Shift Down}{SC003}{Shift up}
return
$*SC003 up::
    SetKeyDelay -1
    if SC003_shifted
        SendInput {Blind}{SC003 up}
    else
        SendInput {Blind}{SC003 up}
return

;; 3 -> # or # or Ellipsis or Ellipsis
$*SC004::
    SC004_shifted := GetKeyState("Shift")
    SetKeyDelay -1
    if SC004_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{Shift Down}{SC004}{Shift up}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{Shift Down}{SC004}{Shift up}
return
$*SC004 up::
    SetKeyDelay -1
    if SC004_shifted
        SendInput {Blind}{SC004 up}
    else
        SendInput {Blind}{SC004 up}
return

;; 4 -> $ or $ or Ellipsis or Ellipsis
$*SC005::
    SC005_shifted := GetKeyState("Shift")
    SetKeyDelay -1
    if SC005_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{Shift Down}{SC005}{Shift up}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{Shift Down}{SC005}{Shift up}
return
$*SC005 up::
    SetKeyDelay -1
    if SC005_shifted
        SendInput {Blind}{SC005 up}
    else
        SendInput {Blind}{SC005 up}
return

;; 5 -> % or % or Ellipsis or Ellipsis
$*SC006::
    SC006_shifted := GetKeyState("Shift")
    SetKeyDelay -1
    if SC006_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{Shift Down}{SC006}{Shift up}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{Shift Down}{SC006}{Shift up}
return
$*SC006 up::
    SetKeyDelay -1
    if SC006_shifted
        SendInput {Blind}{SC006 up}
    else
        SendInput {Blind}{SC006 up}
return

;; 6 -> ^ or ^ or Ellipsis or Ellipsis
$*SC007::
    SC007_shifted := GetKeyState("Shift")
    SetKeyDelay -1
    if SC007_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{Shift Down}{SC007}{Shift up}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{Shift Down}{SC007}{Shift up}
return
$*SC007 up::
    SetKeyDelay -1
    if SC007_shifted
        SendInput {Blind}{SC007 up}
    else
        SendInput {Blind}{SC007 up}
return

;; 7 -> & or | or Ellipsis or Ellipsis
$*SC008::
    SC008_shifted := GetKeyState("Shift")
    SetKeyDelay -1
    if SC008_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{Shift Down}{SC02B}{Shift up}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{Shift Down}{SC008}{Shift up}
return
$*SC008 up::
    SetKeyDelay -1
    if SC008_shifted
        SendInput {Blind}{SC02B up}
    else
        SendInput {Blind}{SC008 up}
return

;; 8 -> * or / or Ellipsis or Ellipsis
$*SC009::
    SC009_shifted := GetKeyState("Shift")
    SetKeyDelay -1
    if SC009_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{SC035}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{Shift Down}{SC009}{Shift up}
return
$*SC009 up::
    SetKeyDelay -1
    if SC009_shifted
        SendInput {Blind}{SC035 up}
    else
        SendInput {Blind}{SC009 up}
return

;; 9 -> ( or { or Ellipsis or Ellipsis
$*SC00A::
    SC00A_shifted := GetKeyState("Shift")
    SetKeyDelay -1
    if SC00A_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{Shift Down}{SC01A}{Shift up}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{Shift Down}{SC00A}{Shift up}
return
$*SC00A up::
    SetKeyDelay -1
    if SC00A_shifted
        SendInput {Blind}{SC01A up}
    else
        SendInput {Blind}{SC00A up}
return

;; 0 -> ) or } or Ellipsis or Ellipsis
$*SC00B::
    SC00B_shifted := GetKeyState("Shift")
    SetKeyDelay -1
    if SC00B_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{Shift Down}{SC01B}{Shift up}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{Shift Down}{SC00B}{Shift up}
return
$*SC00B up::
    SetKeyDelay -1
    if SC00B_shifted
        SendInput {Blind}{SC01B up}
    else
        SendInput {Blind}{SC00B up}
return

;; - -> [ or < or Ellipsis or Ellipsis
$*SC00C::
    SC00C_shifted := GetKeyState("Shift")
    SetKeyDelay -1
    if SC00C_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{Shift Down}{SC033}{Shift up}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{SC01A}
return
$*SC00C up::
    SetKeyDelay -1
    if SC00C_shifted
        SendInput {Blind}{SC033 up}
    else
        SendInput {Blind}{SC01A up}
return

;; = -> ] or > or Ellipsis or Ellipsis
$*SC00D::
    SC00D_shifted := GetKeyState("Shift")
    SetKeyDelay -1
    if SC00D_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{Shift Down}{SC034}{Shift up}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{SC01B}
return
$*SC00D up::
    SetKeyDelay -1
    if SC00D_shifted
        SendInput {Blind}{SC034 up}
    else
        SendInput {Blind}{SC01B up}
return

;; Backspace -> ` or Ellipsis or Ellipsis or Ellipsis
$*Backspace::
    SetKeyDelay -1
    SendInput {Blind}{SC029}
return
$*Backspace up::
    SetKeyDelay -1
    SendInput {Blind}{SC029 up}
return

;; TOP ROW

;; q -> Delete or Ellipsis or Ellipsis or Ellipsis
$*SC010::
    SetKeyDelay -1
    SendInput {Blind}{Delete}
return
$*SC010 up::
    SetKeyDelay -1
    SendInput {Blind}{Delete up}
return

;; w -> q or Ellipsis or Save or Ellipsis
$*SC011::
    SC011_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC011_extended {
        SendInput {Blind}{Ctrl Down}{SC01F}{Ctrl up}
        was_used := true
    }
    else
        SendInput {Blind}{SC010}
return
$*SC011 up::
    SetKeyDelay -1
    if SC011_extended
        SendInput {Blind}{SC01F up}
    else
        SendInput {Blind}{SC010 up}
return

;; e -> w or Ellipsis or : or :
$*SC012::
    SC012_shifted := GetKeyState("Shift")
    SC012_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC012_extended {
        if SC012_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{Shift Down}{SC027}{Shift up}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{Shift Down}{SC027}{Shift up}
        was_used := true
    }
    else
        SendInput {Blind}{SC011}
return
$*SC012 up::
    SetKeyDelay -1
    if SC012_extended {
        if SC012_shifted
            SendInput {Blind}{SC027 up}
        else
            SendInput {Blind}{SC027 up}
    }
    else
        SendInput {Blind}{SC011 up}
return

;; r -> f or Ellipsis or ; or ;
$*SC013::
    SC013_shifted := GetKeyState("Shift")
    SC013_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC013_extended {
        if SC013_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{SC027}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC027}
        was_used := true
    }
    else
        SendInput {Blind}{SC021}
return
$*SC013 up::
    SetKeyDelay -1
    if SC013_extended {
        if SC013_shifted
            SendInput {Blind}{SC027 up}
        else
            SendInput {Blind}{SC027 up}
    }
    else
        SendInput {Blind}{SC021 up}
return

;; t -> p or Ellipsis or 7 or '±'
$*SC014::
    SC014_shifted := GetKeyState("Shift")
    SC014_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC014_extended {
        if SC014_shifted {
            SendInput {Blind}{Shift Up}
            Send, ±
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC008}
        was_used := true
    }
    else
        SendInput {Blind}{SC019}
return
$*SC014 up::
    SetKeyDelay -1
    if SC014_extended {
        if SC014_shifted
            return
        else
            SendInput {Blind}{SC008 up}
    }
    else
        SendInput {Blind}{SC019 up}
return

;; y -> g or Ellipsis or 8 or -
$*SC015::
    SC015_shifted := GetKeyState("Shift")
    SC015_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC015_extended {
        if SC015_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{SC00C}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC009}
        was_used := true
    }
    else
        SendInput {Blind}{SC022}
return
$*SC015 up::
    SetKeyDelay -1
    if SC015_extended {
        if SC015_shifted
            SendInput {Blind}{SC00C up}
        else
            SendInput {Blind}{SC009 up}
    }
    else
        SendInput {Blind}{SC022 up}
return

;; u -> j or Ellipsis or 9 or +
$*SC016::
    SC016_shifted := GetKeyState("Shift")
    SC016_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC016_extended {
        if SC016_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{Shift Down}{SC00D}{Shift up}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC00A}
        was_used := true
    }
    else
        SendInput {Blind}{SC024}
return
$*SC016 up::
    SetKeyDelay -1
    if SC016_extended {
        if SC016_shifted
            SendInput {Blind}{SC00D up}
        else
            SendInput {Blind}{SC00A up}
    }
    else
        SendInput {Blind}{SC024 up}
return

;; i -> l or Ellipsis or Pgup or Ellipsis
$*SC017::
    SC017_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC017_extended {
        SendInput {Blind}{Pgup}
        was_used := true
    }
    else
        SendInput {Blind}{SC026}
return
$*SC017 up::
    SetKeyDelay -1
    if SC017_extended
        SendInput {Blind}{Pgup up}
    else
        SendInput {Blind}{SC026 up}
return

;; o -> u or Ellipsis or Home or Ellipsis
$*SC018::
    SC018_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC018_extended {
        SendInput {Blind}{Home}
        was_used := true
    }
    else
        SendInput {Blind}{SC016}
return
$*SC018 up::
    SetKeyDelay -1
    if SC018_extended
        SendInput {Blind}{Home up}
    else
        SendInput {Blind}{SC016 up}
return

;; p -> y or Ellipsis or Up or Ellipsis
$*SC019::
    SC019_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC019_extended {
        SendInput {Blind}{Up}
        was_used := true
    }
    else
        SendInput {Blind}{SC015}
return
$*SC019 up::
    SetKeyDelay -1
    if SC019_extended
        SendInput {Blind}{Up up}
    else
        SendInput {Blind}{SC015 up}
return

;; [ -> = or Ellipsis or End or Ellipsis
$*SC01A::
    SC01A_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC01A_extended {
        SendInput {Blind}{End}
        was_used := true
    }
    else
        SendInput {Blind}{SC00D}
return
$*SC01A up::
    SetKeyDelay -1
    if SC01A_extended
        SendInput {Blind}{End up}
    else
        SendInput {Blind}{SC00D up}
return

;; ] -> - or ! or Ellipsis or Ellipsis
$*SC01B::
    SC01B_shifted := GetKeyState("Shift")
    SetKeyDelay -1
    if SC01B_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{Shift Down}{SC002}{Shift up}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{SC00C}
return
$*SC01B up::
    SetKeyDelay -1
    if SC01B_shifted
        SendInput {Blind}{SC002 up}
    else
        SendInput {Blind}{SC00C up}
return

;; MIDDLE ROW

;; CapsLock -> Enter or Ellipsis or Ellipsis or Ellipsis
$*CapsLock::
    SetKeyDelay -1
    SendInput {Blind}{Enter}
return
$*CapsLock up::
    SetKeyDelay -1
    SendInput {Blind}{Enter up}
return

;; a -> Backspace or Ellipsis or Ellipsis or Ellipsis
$*SC01E::
    SetKeyDelay -1
    SendInput {Blind}{Backspace}
return
$*SC01E up::
    SetKeyDelay -1
    SendInput {Blind}{Backspace up}
return

;; s -> a or Ellipsis or Redo or Ellipsis
$*SC01F::
    SC01F_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC01F_extended {
        SendInput {Blind}{Ctrl Down}{SC015}{Ctrl up}
        was_used := true
    }
    else
        SendInput {Blind}{SC01E}
return
$*SC01F up::
    SetKeyDelay -1
    if SC01F_extended
        SendInput {Blind}{SC015 up}
    else
        SendInput {Blind}{SC01E up}
return

;; d -> r or Ellipsis or , or ,
$*SC020::
    SC020_shifted := GetKeyState("Shift")
    SC020_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC020_extended {
        if SC020_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{SC033}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC033}
        was_used := true
    }
    else
        SendInput {Blind}{SC013}
return
$*SC020 up::
    SetKeyDelay -1
    if SC020_extended {
        if SC020_shifted
            SendInput {Blind}{SC033 up}
        else
            SendInput {Blind}{SC033 up}
    }
    else
        SendInput {Blind}{SC013 up}
return

;; f -> s or Ellipsis or . or .
$*SC021::
    SC021_shifted := GetKeyState("Shift")
    SC021_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC021_extended {
        if SC021_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{SC034}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC034}
        was_used := true
    }
    else
        SendInput {Blind}{SC01F}
return
$*SC021 up::
    SetKeyDelay -1
    if SC021_extended {
        if SC021_shifted
            SendInput {Blind}{SC034 up}
        else
            SendInput {Blind}{SC034 up}
    }
    else
        SendInput {Blind}{SC01F up}
return

;; g -> t or Ellipsis or 4 or d
$*SC022::
    SC022_shifted := GetKeyState("Shift")
    SC022_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC022_extended {
        if SC022_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{SC020}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC005}
        was_used := true
    }
    else
        SendInput {Blind}{SC014}
return
$*SC022 up::
    SetKeyDelay -1
    if SC022_extended {
        if SC022_shifted
            SendInput {Blind}{SC020 up}
        else
            SendInput {Blind}{SC005 up}
    }
    else
        SendInput {Blind}{SC014 up}
return

;; h -> d or Ellipsis or 5 or e
$*SC023::
    SC023_shifted := GetKeyState("Shift")
    SC023_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC023_extended {
        if SC023_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{SC012}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC006}
        was_used := true
    }
    else
        SendInput {Blind}{SC020}
return
$*SC023 up::
    SetKeyDelay -1
    if SC023_extended {
        if SC023_shifted
            SendInput {Blind}{SC012 up}
        else
            SendInput {Blind}{SC006 up}
    }
    else
        SendInput {Blind}{SC020 up}
return

;; j -> h or Ellipsis or 6 or f
$*SC024::
    SC024_shifted := GetKeyState("Shift")
    SC024_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC024_extended {
        if SC024_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{SC021}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC007}
        was_used := true
    }
    else
        SendInput {Blind}{SC023}
return
$*SC024 up::
    SetKeyDelay -1
    if SC024_extended {
        if SC024_shifted
            SendInput {Blind}{SC021 up}
        else
            SendInput {Blind}{SC007 up}
    }
    else
        SendInput {Blind}{SC023 up}
return

;; k -> n or Ellipsis or Pgdn or Ellipsis
$*SC025::
    SC025_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC025_extended {
        SendInput {Blind}{Pgdn}
        was_used := true
    }
    else
        SendInput {Blind}{SC031}
return
$*SC025 up::
    SetKeyDelay -1
    if SC025_extended
        SendInput {Blind}{Pgdn up}
    else
        SendInput {Blind}{SC031 up}
return

;; l -> e or Ellipsis or Left or Ellipsis
$*SC026::
    SC026_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC026_extended {
        SendInput {Blind}{Left}
        was_used := true
    }
    else
        SendInput {Blind}{SC012}
return
$*SC026 up::
    SetKeyDelay -1
    if SC026_extended
        SendInput {Blind}{Left up}
    else
        SendInput {Blind}{SC012 up}
return

;; ; -> i or Ellipsis or Down or Ellipsis
$*SC027::
    SC027_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC027_extended {
        SendInput {Blind}{Down}
        was_used := true
    }
    else
        SendInput {Blind}{SC017}
return
$*SC027 up::
    SetKeyDelay -1
    if SC027_extended
        SendInput {Blind}{Down up}
    else
        SendInput {Blind}{SC017 up}
return

;; ' -> o or Ellipsis or Right or Ellipsis
$*SC028::
    SC028_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC028_extended {
        SendInput {Blind}{Right}
        was_used := true
    }
    else
        SendInput {Blind}{SC018}
return
$*SC028 up::
    SetKeyDelay -1
    if SC028_extended
        SendInput {Blind}{Right up}
    else
        SendInput {Blind}{SC018 up}
return

;; Enter -> ' or Ellipsis or Ellipsis or Ellipsis
$*Enter::
    SetKeyDelay -1
    SendInput {Blind}{SC028}
return
$*Enter up::
    SetKeyDelay -1
    SendInput {Blind}{SC028 up}
return

;; BOTTOM ROW

;; z -> z or Ellipsis or Undo or Ellipsis
$*SC02C::
    SC02C_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC02C_extended {
        SendInput {Blind}{Ctrl Down}{SC02C}{Ctrl up}
        was_used := true
    }
    else
        SendInput {Blind}{SC02C}
return
$*SC02C up::
    SetKeyDelay -1
    if SC02C_extended
        SendInput {Blind}{SC02C up}
    else
        SendInput {Blind}{SC02C up}
return

;; x -> x or Ellipsis or Cut or Ellipsis
$*SC02D::
    SC02D_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC02D_extended {
        SendInput {Blind}{Ctrl Down}{SC02D}{Ctrl up}
        was_used := true
    }
    else
        SendInput {Blind}{SC02D}
return
$*SC02D up::
    SetKeyDelay -1
    if SC02D_extended
        SendInput {Blind}{SC02D up}
    else
        SendInput {Blind}{SC02D up}
return

;; c -> c or Ellipsis or Copy or Ellipsis
$*SC02E::
    SC02E_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC02E_extended {
        SendInput {Blind}{Ctrl Down}{SC02E}{Ctrl up}
        was_used := true
    }
    else
        SendInput {Blind}{SC02E}
return
$*SC02E up::
    SetKeyDelay -1
    if SC02E_extended
        SendInput {Blind}{SC02E up}
    else
        SendInput {Blind}{SC02E up}
return

;; v -> v or Ellipsis or Paste or Ellipsis
$*SC02F::
    SC02F_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC02F_extended {
        SendInput {Blind}{Ctrl Down}{SC02F}{Ctrl up}
        was_used := true
    }
    else
        SendInput {Blind}{SC02F}
return
$*SC02F up::
    SetKeyDelay -1
    if SC02F_extended
        SendInput {Blind}{SC02F up}
    else
        SendInput {Blind}{SC02F up}
return

;; b -> b or Ellipsis or 1 or a
$*SC030::
    SC030_shifted := GetKeyState("Shift")
    SC030_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC030_extended {
        if SC030_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{SC01E}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC002}
        was_used := true
    }
    else
        SendInput {Blind}{SC030}
return
$*SC030 up::
    SetKeyDelay -1
    if SC030_extended {
        if SC030_shifted
            SendInput {Blind}{SC01E up}
        else
            SendInput {Blind}{SC002 up}
    }
    else
        SendInput {Blind}{SC030 up}
return

;; n -> _ or _ or 2 or b
$*SC031::
    SC031_shifted := GetKeyState("Shift")
    SC031_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC031_extended {
        if SC031_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{SC030}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC003}
        was_used := true
    }
    else if SC031_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{Shift Down}{SC00C}{Shift up}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{Shift Down}{SC00C}{Shift up}
return
$*SC031 up::
    SetKeyDelay -1
    if SC031_extended {
        if SC031_shifted
            SendInput {Blind}{SC030 up}
        else
            SendInput {Blind}{SC003 up}
    }
    else if SC031_shifted
        SendInput {Blind}{SC00C up}
    else
        SendInput {Blind}{SC00C up}
return

;; m -> k or Ellipsis or 3 or c
$*SC032::
    SC032_shifted := GetKeyState("Shift")
    SC032_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC032_extended {
        if SC032_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{SC02E}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC004}
        was_used := true
    }
    else
        SendInput {Blind}{SC025}
return
$*SC032 up::
    SetKeyDelay -1
    if SC032_extended {
        if SC032_shifted
            SendInput {Blind}{SC02E up}
        else
            SendInput {Blind}{SC004 up}
    }
    else
        SendInput {Blind}{SC025 up}
return

;; , -> m or Ellipsis or 0 or e
$*SC033::
    SC033_shifted := GetKeyState("Shift")
    SC033_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC033_extended {
        if SC033_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{SC012}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC00B}
        was_used := true
    }
    else
        SendInput {Blind}{SC032}
return
$*SC033 up::
    SetKeyDelay -1
    if SC033_extended {
        if SC033_shifted
            SendInput {Blind}{SC012 up}
        else
            SendInput {Blind}{SC00B up}
    }
    else
        SendInput {Blind}{SC032 up}
return

;; . -> , or : or x or X
$*SC034::
    SC034_shifted := GetKeyState("Shift")
    SC034_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC034_extended {
        if SC034_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{Shift Down}{SC02D}{Shift up}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC02D}
        was_used := true
    }
    else if SC034_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{Shift Down}{SC027}{Shift up}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{SC033}
return
$*SC034 up::
    SetKeyDelay -1
    if SC034_extended {
        if SC034_shifted
            SendInput {Blind}{SC02D up}
        else
            SendInput {Blind}{SC02D up}
    }
    else if SC034_shifted
        SendInput {Blind}{SC027 up}
    else
        SendInput {Blind}{SC033 up}
return

;; / -> . or ; or b or B
$*SC035::
    SC035_shifted := GetKeyState("Shift")
    SC035_extended := is_extend_mode_on
    SetKeyDelay -1
    if SC035_extended {
        if SC035_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{Shift Down}{SC030}{Shift up}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC030}
        was_used := true
    }
    else if SC035_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{SC027}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{SC034}
return
$*SC035 up::
    SetKeyDelay -1
    if SC035_extended {
        if SC035_shifted
            SendInput {Blind}{SC030 up}
        else
            SendInput {Blind}{SC030 up}
    }
    else if SC035_shifted
        SendInput {Blind}{SC027 up}
    else
        SendInput {Blind}{SC034 up}
return

;; RShift -> / or ? or o or O
$*RShift::
    RShift_shifted := GetKeyState("Shift")
    RShift_extended := is_extend_mode_on
    SetKeyDelay -1
    if RShift_extended {
        if RShift_shifted {
            SendInput {Blind}{Shift Up}
            SendInput {Blind}{Shift Down}{SC018}{Shift up}
            SendInput {Blind}{Shift Down}
        }
        else
            SendInput {Blind}{SC018}
        was_used := true
    }
    else if RShift_shifted {
        SendInput {Blind}{Shift Up}
        SendInput {Blind}{Shift Down}{SC035}{Shift up}
        SendInput {Blind}{Shift Down}
    }
    else
        SendInput {Blind}{SC035}
return
$*RShift up::
    SetKeyDelay -1
    if RShift_extended {
        if RShift_shifted
            SendInput {Blind}{SC018 up}
        else
            SendInput {Blind}{SC018 up}
    }
    else if RShift_shifted
        SendInput {Blind}{SC035 up}
    else
        SendInput {Blind}{SC035 up}
return

;; SPACEBAR ROW

;; RWin -> Escape or Ellipsis or Ellipsis or Ellipsis
$*RWin::
    SetKeyDelay -1
    SendInput {Blind}{Escape}
return
$*RWin up::
    SetKeyDelay -1
    SendInput {Blind}{Escape up}
return

;; AppsKey -> 
AppsKey::return
;; RCtrl -> 
RCtrl::return
;; DISABLE NUMLOCK

;; NumLock -> 
NumLock::return
;; NumpadDel -> NumpadDot or Ellipsis or Ellipsis or Ellipsis
$*NumpadDel::
    SetKeyDelay -1
    SendInput {Blind}{NumpadDot}
return
$*NumpadDel up::
    SetKeyDelay -1
    SendInput {Blind}{NumpadDot up}
return

;; NumpadIns -> Numpad0 or Ellipsis or Ellipsis or Ellipsis
$*NumpadIns::
    SetKeyDelay -1
    SendInput {Blind}{Numpad0}
return
$*NumpadIns up::
    SetKeyDelay -1
    SendInput {Blind}{Numpad0 up}
return

;; NumpadEnd -> Numpad1 or Ellipsis or Ellipsis or Ellipsis
$*NumpadEnd::
    SetKeyDelay -1
    SendInput {Blind}{Numpad1}
return
$*NumpadEnd up::
    SetKeyDelay -1
    SendInput {Blind}{Numpad1 up}
return

;; NumpadDown -> Numpad2 or Ellipsis or Ellipsis or Ellipsis
$*NumpadDown::
    SetKeyDelay -1
    SendInput {Blind}{Numpad2}
return
$*NumpadDown up::
    SetKeyDelay -1
    SendInput {Blind}{Numpad2 up}
return

;; NumpadPgdn -> Numpad3 or Ellipsis or Ellipsis or Ellipsis
$*NumpadPgdn::
    SetKeyDelay -1
    SendInput {Blind}{Numpad3}
return
$*NumpadPgdn up::
    SetKeyDelay -1
    SendInput {Blind}{Numpad3 up}
return

;; NumpadLeft -> Numpad4 or Ellipsis or Ellipsis or Ellipsis
$*NumpadLeft::
    SetKeyDelay -1
    SendInput {Blind}{Numpad4}
return
$*NumpadLeft up::
    SetKeyDelay -1
    SendInput {Blind}{Numpad4 up}
return

;; NumpadClear -> Numpad5 or Ellipsis or Ellipsis or Ellipsis
$*NumpadClear::
    SetKeyDelay -1
    SendInput {Blind}{Numpad5}
return
$*NumpadClear up::
    SetKeyDelay -1
    SendInput {Blind}{Numpad5 up}
return

;; NumpadRight -> Numpad6 or Ellipsis or Ellipsis or Ellipsis
$*NumpadRight::
    SetKeyDelay -1
    SendInput {Blind}{Numpad6}
return
$*NumpadRight up::
    SetKeyDelay -1
    SendInput {Blind}{Numpad6 up}
return

;; NumpadHome -> Numpad7 or Ellipsis or Ellipsis or Ellipsis
$*NumpadHome::
    SetKeyDelay -1
    SendInput {Blind}{Numpad7}
return
$*NumpadHome up::
    SetKeyDelay -1
    SendInput {Blind}{Numpad7 up}
return

;; NumpadUp -> Numpad8 or Ellipsis or Ellipsis or Ellipsis
$*NumpadUp::
    SetKeyDelay -1
    SendInput {Blind}{Numpad8}
return
$*NumpadUp up::
    SetKeyDelay -1
    SendInput {Blind}{Numpad8 up}
return

;; NumpadPgup -> Numpad9 or Ellipsis or Ellipsis or Ellipsis
$*NumpadPgup::
    SetKeyDelay -1
    SendInput {Blind}{Numpad9}
return
$*NumpadPgup up::
    SetKeyDelay -1
    SendInput {Blind}{Numpad9 up}
return

insert_unicode_down(){
    InputBox, hex, Enter hex, hex
    Send {U+%hex%}
    return
    
}
insert_unicode_up(){
    
}
copy_numbers_down(){
    InputBox, range_start, Enter range, range start (inclusive)
    InputBox, range_end, Enter range, range end (inclusive)
    out := ""
    i := range_start
    While i <= range_end {
        out .= i . "`n"
        i += 1
    }
    Clipboard = %out%
    
}
copy_numbers_up(){
    
}

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

