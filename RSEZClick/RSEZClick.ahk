; =======================================================================================
; Name ..........: RSEZClick.ahk
; Description ...: This will allow you to set two mouse points and click back and forth using keyboard buttons.
; AHK Version ...: AHK_A 1.1.30.1 (Unicode 32-bit) - Dec 26, 2018
; Platform ......: Windows 2000+
; Language ......: English (en-US)
; =======================================================================================

; Global ================================================================================
#SingleInstance, Force ; Allow only one running instance of script
#Persistent ; Keep script permanently running until terminated
#NoEnv ; Avoid checking empty variables to see if they are environment variables
;#Warn ; Enable warnings to assist with detecting common errors
;#NoTrayIcon ; Disable the tray icon of the script
SendMode, Input ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir, %A_ScriptDir% ; Change the working directory of the script
SetBatchLines, -1 ; Run script at maximum speed
OnExit, ExitSub ; Run a subroutine or function automatically when the script exits
; =======================================================================================

; Script ================================================================================
	
	Return ; End automatic execution

; =======================================================================================
ButtonStart:
	;MsgBox, , 4096, Click to set position click 1
	Gui, Add, Text, x10 y95, V Key
	KeyWait, LButton, D
	MouseGetPos, x1, y1
	KeyWait, LButton, U
	Gui, Add, Text, x120 y95, %x1% %y1% 
	Gui, Add, Text, x10 y120, B Key
	KeyWait, LButton, D
	MouseGetPos, x2, y2
	KeyWait, LButton, U
	Gui, Add, Text, x120 y120, %x2% %y2% 
	;MsgBox, , 4096, %x1% %y1% %x2% %y2%
	Return
	
ButtonExit:
	ExitApp
	Return
	
Submit_All: ;this submits the values into variables as soon as a change is made
	Gui, Submit, NoHide
	Return
	
vAction:
	Random, rand, 1, 35
	Random, randX, 0, 1
	Random, randY, 0, 1
	
	my1 := 0
	mx1 := 0
	if(randX = 0)
	{
		mx1 := (x1 + rand)
	}
	if(randX = 1)
	{
		mx1 := (x1 - rand)
	}
		
	if(randY = 0)
	{
		my1 := (y1 + rand)
	}			
	if(randY = 1)
	{
		my1 := (y1 - rand)

	}
	MouseClick, L, mx1, my1, , 100, D
	sleep, rand * 10
	MouseClick, L, mx1, my1, , 100, U
	Return
	
bAction:
	Random, rand, 1, 35
	Random, randX, 0, 1
	Random, randY, 0, 1
	
	my2 := 0
	mx2 := 0
	if(randX = 0)
	{
		mx2 := (x2 + rand)
	}
	if(randX = 1)
	{
		mx2 := (x2 - rand)
	}
		
	if(randY = 0)
	{
		my2 := (y2 + rand)
	}			
	if(randY = 1)
	{
		my2 := (y2 - rand)

	}
	MouseClick, L, mx2, my2, , 100, D
	sleep, rand * 10
	MouseClick, L, mx2, my2, , 100, U
	Return
	
; MAIN GUI FUNCTIONS ====================================================================

v::GoSub, vAction
b::GoSub, bAction

Escape::ExitApp ;this is our emergey stop if something goes wrong
ExitSub:
	ExitApp ; Terminate the script unconditionally
	Return
; ========================================================================================

; Main Function =========================================================================

GUIMain()
{
	Static GUICreate := GUIMain()
	
	Global
	
	GUIWidth := 225, GUIHeight := 400
	
	Menu, Tray, Icon, Shell32.dll, 174 ; Change the tray icon
	Menu, Tray, Tip, GSTagManager ; Change the tooltip of the tray icon
	Menu, Tray, NoStandard ; Remove all standard tray menu items
	Menu, Tray, Add, Exit, ExitSub

	Gui, +LastFound -Resize
	Gui, Margin, 10, 10
	
	
	;THIS IS OUR MAIN GUI AND ACTION SELECTOR
	CoordMode, Mouse, Screen ;Place Mouse at absolute screen coordinates
	Gui, Add, Button, % " x" 10 " y" 10 " w" 200 " h" 30, Start
	;Gui, Add, Button, % " x" 10 " y" 50 " w" 200 " h" 30, GSCC
	;Gui, Add, DropDownList, x100 y90 w109 vItem gSubmit_All,Select Item||Computer|TV|Phone or Tablet
	;Gui, Add, Text, x10 y95, What is certified?
	;Gui, Add, DropDownList, x100 y120 w109 vAction gSubmit_All,Select Action||Create|Close|Both
	;Gui, Add, Text, x10 y125, Select an action?
	;Gui, Add, Button, % " x" 10 " y" 150 " w" 200 " h" 30, GSDR
	;Gui, Add, Button, % " x" 10 " y" 320 " w" 200 " h" 30, ReadMe ;ORIGINAL POSITIONING Gui, Add, Button, % " x" 10 " y" 240 " w" 200 " h" 30, ReadMe
	;Gui, Add, Button, % " x" 10 " y" 280 " w" 200 " h" 30, Test  
	;Gui, Add, Button, % " x" 10 " y" 320 " w" 200 " h" 30, Get Mouse Pos
	;Gui, Add, Button, % " x" 10 " y" 360 " w" 100 " h" 30, Change Initials
	Gui, Add, Button, % " x" 110 " y" 360 " w" 100 " h" 30, Exit

	Gui, Show, % " w" GUIWidth " h" GUIHeight, TagManager
	Return
}
; =======================================================================================
