#include <Misc.au3>
#include <ImageSearch2015.au3>
Global $Paused = 0
Global $X = 0
Global $Y = 0
$left = 1270
$top = 52
$right = 1632
$bottom = 587
$tolerance  = 16 ; works well
$search1 = 0
$sFileName = @ScriptDir &"\Pulls.txt"
$hFilehandle = FileOpen($sFileName, $FO_OVERWRITE)
;hotkeys
HotKeySet("{F1}", "TogglePause")
HotKeySet("{F2}", "Terminate")
Pulls()

Func Pulls()
  Global $Glorious = False
While $search1 = 0
    ToolTip('Searching for Pulls... ',0,25)
	;Global $search = _ImageSearch('common.bmp', 0, $X, $Y, $tolerance)
   $search = _ImageSearchArea('monster.bmp', 0 , $left, $top, $right, $bottom, $X, $Y, $tolerance)
   If $search = 1 Then
	  $Glorious = True
	  WritePull()
   EndIf
WEnd
EndFunc

Func glorious()
   While $Glorious = True
   ToolTip('You Pulled A Monster Card... ',0,25)
   SoundPlay("Glorious.wav", 1)
   $Glorious = False
   WEnd
EndFunc

Func WritePull()
; Write a line
   FileWrite($hFilehandle, "You Pulled A Monster Card")
   ; Close the file handle
   FileClose($hFilehandle)
   glorious()
EndFunc


;pause script
Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
        sleep(100)
        ToolTip('Script is "Paused"',0,25)
    WEnd
    ToolTip("")
EndFunc
;termination script
Func Terminate()
  Exit 0
EndFunc