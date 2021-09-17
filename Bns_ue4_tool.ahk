#NoTrayIcon
#Persistent
#NoEnv
#SingleInstance

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)")) {
    try 
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}

createGUI()
return

;@Ahk2Exe-SetName Bns_ue4_tool
;@Ahk2Exe-SetDescription Bns_ue4_tool

createGUI(){
    Gui, Show, W220 H100, UE4 config

    Gui, Font, s10 q4, Calibri
    Gui, Font,, Console
    Gui, Font,, Microsoft JhengHei
    
    Gui, Add, Text, x5 y10, Start Movie
    Gui, Add, Text, x5 y40, UI Effect
    Gui, Add, Text, x5 y70, MouseSmoothing

    
    Gui, Add, Button, gmovieon x120 y6, 開啟
    Gui, Add, Button, gmovieoff x175 y6, 關閉
    Gui, Add, Button, guion x120 y36, 開啟
    Gui, Add, Button, guioff x175 y36, 關閉
    Gui, Add, Button, gmson x120 y66, 開啟
    Gui, Add, Button, gmsoff x175 y66, 關閉
}

GuiClose()
{
    ExitApp
}

movieon(){
    _path = C:\Users\%A_UserName%\AppData\Local\BNSR\Saved\Config\WindowsNoEditor
    IniDelete, %_path%\Game.ini, /Script/MoviePlayer.MoviePlayerSettings, bWaitForMoviesToComplete
    IniDelete, %_path%\Game.ini, /Script/MoviePlayer.MoviePlayerSettings, bMoviesAreSkippable
    IniDelete, %_path%\Game.ini, /Script/MoviePlayer.MoviePlayerSettings, StartupMovies
}
movieoff(){
    _path = C:\Users\%A_UserName%\AppData\Local\BNSR\Saved\Config\WindowsNoEditor
    IniWrite, False, %_path%\Game.ini, /Script/MoviePlayer.MoviePlayerSettings, bWaitForMoviesToComplete
    IniWrite, True, %_path%\Game.ini, /Script/MoviePlayer.MoviePlayerSettings, bMoviesAreSkippable
    IniWrite, % "", %_path%\Game.ini, /Script/MoviePlayer.MoviePlayerSettings, StartupMovies
}


uion(){
    _path = C:\Users\%A_UserName%\AppData\Local\BNSR\Saved\Config\WindowsNoEditor
    IniDelete, %_path%\Engine.ini, /Script/BNS.BNSRuntimeSettings, bEnableUIPaticle
}
uioff(){
    _path = C:\Users\%A_UserName%\AppData\Local\BNSR\Saved\Config\WindowsNoEditor
    IniWrite, False, %_path%\Engine.ini, /Script/BNS.BNSRuntimeSettings, bEnableUIPaticle
}

mson(){
    _path = C:\Users\%A_UserName%\AppData\Local\BNSR\Saved\Config\WindowsNoEditor
    IniDelete, %_path%\Input.ini, /Script/Engine.InputSettings, bEnableMouseSmoothing
}
msoff(){
    _path = C:\Users\%A_UserName%\AppData\Local\BNSR\Saved\Config\WindowsNoEditor
    IniWrite, False, %_path%\Input.ini, /Script/Engine.InputSettings, bEnableMouseSmoothing
}
