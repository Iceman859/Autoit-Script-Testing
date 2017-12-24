;autoit script: Auto-Craft macro for Star Wars Galaxies Emulator by zierk v1.4
; Modified By Iceman

;Setup:
;This script is designed to run with crafting tools located in the 1-8 action bar slots.
;A macro for "/ui action defaultButton" located in slot 9
;A macro for "/nextCraftingStage"x3 and "/createPrototype practice no item"x3 located in slot 0

;Hotkeys:
;Hit PAUSE key to pause the script, press PAUSE again to resume
;Hit END key to terminate the program

;Variables
;Declare $r's value based on how many 'boxes' there are for resources in the crafting window
;Example: You are making a Percision Laser Knife which requires the same metal resources 4 times,
;you will set $r to 4 and select the same metal resource each time.

;Directions:
;Open your crafting tool and select the recipie you want to grind on, then close the crafting window (DO this PRIOR to running script!)
;Run script, select up to 5 resources then let the macro auto craft for you
;change the value of $i below to determine how many items will be crafted

#include <Misc.au3>

;define vars
Global $Paused = 0
$i = 600 ;how many total crafts are needed
$j = 1 ;which crafting tool to start with(always keep as 1)
$r = 2 ;how many resource positions are needed per craft (put 1-5)

;define hotkeys
HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{END}", "Terminate")

;This pause stops the script before any in-game windows are selected.
;Added this to support people who multi-box, so they have an opportunity
;to select which window their crafter is in. If you only run 1 box Then
;feel free to remove the pause and uncomment the WinActivate line.

;WinActivate("SwgClient", "") ;activate SWG window
TogglePause()

Sleep(1000)
Init()
Sleep(1000)

;start crafting
SplashTextOn("Auto Craft Setup", "AutoCraft Setup Complete. Starting in 5 Seconds... ", 400, 100, -1, 675, 0, "Courier New", 10)
Sleep(1000)
SplashOff()

;main crafting loop
while $i > 0

   ToolTip($i & " crafts remaining.",0,0)
   ;ToolTip($j & " Tool Is Active",0,0); Debug for $j
   ErrorCheck()
   Sleep(2000)
   OpenCraftingTool()
   Sleep(1000)
   NextStep()
   Sleep(1000)


   $i = $i - 1

   If $j > 7 Then
	  $j = 1
   Else
	  $j = $j + 1
   EndIf
WEnd



Func Init()

   if $r < 1 Or $r > 5 Then ; ERROR CHECK For Invalid Resource Number
	  SplashTextOn("Auto Craft Setup", "Error. Please set $r to a value between 1 and 5.", 400, 100, -1, 675, 0, "Courier New", 10)
	  Sleep(5000)
	  Terminate()
   EndIF

   ;initialize macro
   ToolTip('Starting Setup. Please Standby... ',0,0)
   Sleep(1500)
   ToolTip("")
   Send ("{1 1}") ;use first crafting tool
   Sleep(2000)
   Send ("{9 1}") ;next step
   Sleep(2000)

   ;store mouse position for 1st resource
   SplashTextOn("Auto Craft Setup", "Please Click on the center of the 1st resource.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
	  Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd
   SplashOff()
   Global $res0 = $pos[0]
   Global $res1 = $pos[1]
   Sleep ( 1000 )

if $r > 1 Then
   ;store mouse position for 2nd resource
   SplashTextOn("Auto Craft Setup", "Please Click on the center of the 2nd resource.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
	  Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd
   SplashOff()
   Global $res2 = $pos[0]
   Global $res3 = $pos[1]
   Sleep ( 1000 )
EndIf

if $r > 2 Then
   ;store mouse position for 3rd resource
   SplashTextOn("Auto Craft Setup", "Please Click on the center of the 3rd resource.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
   Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd
   SplashOff()
   Global $res4 = $pos[0]
   Global $res5 = $pos[1]
   Sleep ( 1000 )
EndIf

if $r > 3 Then
   ;store mouse position for 4th resource
   SplashTextOn("Auto Craft Setup", "Please Click on the center of the 4th resource.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
	  Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd
   SplashOff()
   Global $res6 = $pos[0]
   Global $res7 = $pos[1]
   Sleep ( 1000 )
EndIf

if $r > 4 Then
   ;store mouse position for 5th resource
   SplashTextOn("Auto Craft Setup", "Please Click on the center of the 5th resource.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
	  Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd
   SplashOff()
   Global $res8 = $pos[0]
   Global $res9 = $pos[1]
   Sleep ( 1000 )
EndIf

   ;cause "You are already crafting" dialoge to appear
   Send ("{1 1}")
   Sleep (500)

   ;store mouse position for OK button
   SplashTextOn("Auto Craft Setup", "Please Click on the 'OK' button on the 'You are already crafting' notification.", 400, 100, -1, 675, 0, "Courier New", 10)
   While 1
   Sleep ( 100 )
	  If _IsPressed("01") Then
		 $pos = MouseGetPos()
		 ExitLoop
	  EndIf
   WEnd
   SplashOff()
   Global $err1 = $pos[0]
   Global $err2 = $pos[1]
   Sleep ( 1000 )

   ;close crafting windows, with redundancy
   Sleep(1000)
   Send ("{ESC 5}")
   Sleep(1000)
   Send ("{ESC 5}")
   Sleep(1000)
   Send ("{ESC 5}")
   Sleep(2000)

EndFunc



;function to manage crafting tool Send commands
Func OpenCraftingTool()

   if $j = 1 Then
	  Send ("{1}")
   ElseIf $j = 2 Then
	  Send ("{2}")
   ElseIf $j = 3 Then
	  Send ("{3}")
   ElseIf $j = 4 Then
	  Send ("{4}")
   ElseIf $j = 5 Then
	  Send ("{5}")
   ElseIf $j = 6 Then
	  Send ("{6}")
   ElseIf $j = 7 Then
	  Send ("{7}")
   ElseIf $j = 8 Then
	  Send ("{8}")
   EndIf

EndFunc


;function to complete crafting steps
Func NextStep()
   Send ("{9}") ;next step
   Sleep(2000) ;  Default 3000
   MouseClick ( "left" , $res0, $res1, 4 )

   if $r > 1 Then
	  Sleep(1000)
	  MouseClick ( "left" , $res2, $res3, 3 )
   EndIf

   if $r > 2 Then
	  Sleep(1000)
	  MouseClick ( "left" , $res4, $res5, 3 )
   EndIf

   if $r > 3 Then
	  Sleep(1000)
	  MouseClick ( "left" , $res6, $res7, 3 )
   EndIf

   if $r > 4 Then
	  Sleep(1000)
	  MouseClick ( "left" , $res8, $res9, 3 )
   EndIf

   Sleep(1000)
   Send ("{0}") ;nextCraftingStage & createprototype practice noitem
   Sleep(1000)
EndFunc

;function to attempt to correct lag
Func ErrorCheck()
   MouseClick ( "left" , $err1, $err2, 3 ) ;attempt to correct lag
   Send ("{0}") ;nextCraftingStage & createprototype practice noitem
EndFunc

;function to pause script
Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
        sleep(100)
        ToolTip('Script is "Paused"',0,0)
    WEnd
    ToolTip("")
EndFunc

;function to quit script
Func Terminate()
    Exit 0
EndFunc