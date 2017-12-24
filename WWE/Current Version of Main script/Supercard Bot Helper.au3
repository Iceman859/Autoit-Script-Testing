#include <Misc.au3>
; This script is used in conjunction with the WWESupercard Bot
; Bot has a 15 run trial and it shuts down after 5 minutes of use
; Not anymore...

;Vars
Global $Paused = 0
$i = 15 ; amount of times Supercard bot can run per day. Default 15
$m = 1 ; Number of VMs that are running (4 Is default) (1 means single device)
$_ToolTip=0

;hotkeys
HotKeySet("{Pause}", "TogglePause")
HotKeySet("{END}", "Terminate")

;Script Startup
SplashTextOn("WWESupercard Bot Helper", "WWESupercard Bot Helper is paused by default press the PAUSE Key to start setup. To exit at any time press END. This window will close in 5 seconds...", 400, 100, -1, 675, 0, "Courier New", 10)
Sleep(5000)
SplashOff()
;TogglePause() ; Pauses On Startup
;Sleep(2000) ; Waits 2 seconds before starting setup.


Init() ; Setup Function
SplashTextOn("Setup", "Setup Complete. Starting in 2 Seconds... ", 400, 100, -1, 675, 0, "Courier New", 10)
Sleep(2000)
SplashOff()
;TogglePause(); pauses script so that you can do what you need to do before the magic happens.
BotTime(); Magic Shit.
ExitScript() ;tells us its exiting

;init
Func Init()
   ;initialize
   ToolTip('Initializing Setup. Standby... ',0,0)
   Sleep(1500)
   ToolTip("")
   ;store mouse position
   SplashTextOn("Setup", "Please Click on the Home Screen Button.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
	  Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd
   SplashOff()
   Global $loc0 = $pos[0]
   Global $loc1 = $pos[1]
   Sleep ( 1000 )

   SplashTextOn("Setup", "Please Click on the Supercard App.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
	  Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd
	SplashOff()
	Global $loc2 = $pos[0]
	Global $loc3 = $pos[1]
	Sleep ( 1000 )

      SplashTextOn("Setup", "Please Click on the Volume Down Button.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
	  Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd

   SplashOff()
   Global $loc16 = $pos[0]
   Global $loc17 = $pos[1]
   Sleep ( 1000 )


if $m > 1 Then
    SplashTextOn("Setup", "Please Click on the SuperCard App.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
	  Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd
   SplashOff()
   Global $loc4 = $pos[0]
   Global $loc5 = $pos[1]
   Sleep ( 1000 )

    SplashTextOn("Setup", "Please Click on the Volume Down Button.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
	  Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd
   SplashOff()
   Global $loc6 = $pos[0]
   Global $loc7 = $pos[1]
   Sleep ( 1000 )
EndIf

if $m > 2 Then
    SplashTextOn("Setup", "Please Click on the SuperCard App.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
	  Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd
   SplashOff()
   Global $loc8 = $pos[0]
   Global $loc9 = $pos[1]
   Sleep ( 1000 )

    SplashTextOn("Setup", "Please Click on the Volume Down Button.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
	  Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd
   SplashOff()
   Global $loc10 = $pos[0]
   Global $loc11 = $pos[1]
   Sleep ( 1000 )
EndIf

if $m > 3 Then
   SplashTextOn("Setup", "Please Click on the SuperCard App.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
	  Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd
   SplashOff()
   Global $loc12 = $pos[0]
   Global $loc13 = $pos[1]
   Sleep ( 1000 )

    SplashTextOn("Setup", "Please Click on the Volume Down Button.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
	  Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd
   SplashOff()
   Global $loc14 = $pos[0]
   Global $loc15 = $pos[1]
   Sleep ( 1000 )
EndIf

   SplashOff()
   Sleep ( 1000 )
EndFunc

;Work gets done here.
Func Main()
While $m > 0

	While $m = 2
		ToolTip("Bot has " & $i & " times left to run *Round Two*",0,0)
		Sleep(307000) ; Tells the script to wait just over 5 minutes before repeating.
		Supercard2() ; Main function that actually does the clicking
		$i = $i - 1
		If $i < 1 Then
		$m = $m - 1
		$i = 15
		EndIf
	WEnd

	While $m = 4
	   ToolTip("Bot has " & $i & " times left to run *Round Three*",0,0)
	   Sleep(307000) ; Tells the script to wait just over 5 minutes before repeating.
	   Supercard3() ; Main function that actually does the clicking
	   $i = $i - 1
	   If $i < 1 Then
		  $m = $m - 1
		  $i = 15
	   EndIf
	WEnd

	While $m = 3
	   ToolTip("Bot has " & $i & " times left to *Final Round*",0,0)
	   Sleep(307000) ; Tells the script to wait just over 5 minutes before repeating.
	   Supercard4() ; Main function that actually does the clicking
	   $i = $i - 1
	   If $i < 1 Then
		  $m = $m - 1
		  $i = 15
	   EndIf
	WEnd

WEnd
EndFunc

;click functions
Func Supercard1()
	  MouseClick("left", $loc2, $loc3, 1 )
	  Sleep(10000)
	  MouseClick("left", $loc16, $loc17, 1 )
	  $i = $i - 1
	  If $i < 1 Then
	  $m = $m - 1
	  EndIf
	  BotTime()
EndFunc

Func Supercard2()
	  MouseClick("left", $loc4, $loc5, 1 )
	  Sleep(15000)
	  MouseClick("left", $loc6, $loc7, 1 )
EndFunc

Func Supercard3()
	  MouseClick("left", $loc8, $loc9, 1 )
	  Sleep(15000)
	  MouseClick("left", $loc10, $loc11, 1 )
EndFunc

Func Supercard4()
	  MouseClick("left", $loc12, $loc13, 1 )
	  Sleep(15000)
	  MouseClick("left", $loc14, $loc15, 1 )
EndFunc


Func BotTime()
    $min = 5
    $sec = 00 ; length
    $timer = TimerInit()
	While $m = 1
	   Sleep(100)
	  $_ToolTip = ToolTip("Bot has " & $i & " times left to run *Round One* Time left: " & $min & ":" & $sec,0 ,0)
        If TimerDiff($timer) > 1000 Then
            $timer = TimerInit()
            $sec -= 1
            If $sec = 0 Then
                $sec = 60
                $min -= 1
				  If $min < 0 Then
				 MouseClick("left", $loc0, $loc1, 1 )
				 Supercard1() ; Main function that actually does the clicking
			   EndIf
			   EndIf
                Switch $min
                    Case 0
                        $min = 0
					 EndSwitch
				  EndIf
		 WEnd
	  EndFunc

;exit script
Func ExitScript()
	SplashTextOn("WWESupercard Bot Helper", "Bot has finished and will exit in 5 seconds...", 400, 100, -1, 675, 0, "Courier New", 10)
	Sleep(5000)
	SplashOff()
EndFunc
;pause script
Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
        sleep(100)
        ToolTip('Script is "Paused"',0,0)
    WEnd
    ToolTip("")
EndFunc
;termination script
Func Terminate()
  Exit 0
EndFunc