; Define the GUI
Gui +OwnDialogs 
Gui -Caption, 
Gui, Add, Edit, x0 y0 w200 h20 vInputText 
Gui, Show, w200 h20, quicknotesgui, 


; Set the hotkey to submit input when Enter is pressed
Gui, Default
Hotkey, IfWinActive, quicknotesgui

While (True)  ; Keep the script running
{
    If (!WinActive("quicknotesgui"))  ; If the GUI window is unfocused
    {
       
        Gui, Destroy
        ExitApp
    }
    Sleep, 100  ; Pause for a short duration before checking again
}

Enter::
    GuiControlGet, InputText
    Run, run.bat "%InputText%", , Hide UseErrorLevel
    
    Gui, Destroy
    ExitApp
return


return

; Define the submit action
Submit:
    Gui, Submit, NoHide
    MsgBox, You entered: %InputText%
return

; Close the GUI when the user presses the X button
GuiClose:
    Gui, Destroy
    ExitApp

Escape::
    Gui, Destroy
    ExitApp




