#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <WinAPI.au3>
#include <Constants.au3>
Global $WS_CAPTION
Opt("WinTitleMatchMode", 2)
While 1
	$GameTitle = "DayZ.exe"
	$hWin = WinGetHandle($GameTitle)
	$iStyle   = _WinAPI_GetWindowLong(GUICtrlGetHandle($hWin), $GWL_STYLE)
	If WinExists($GameTitle) Then
		If BitAND($iStyle, $WS_CAPTION) = $WS_CAPTION Then
			_WinAPI_ShowWindow($hWin,@SW_HIDE)
			_WinAPI_SetWindowLong($hWin, $GWL_STYLE, BitXOR($iStyle, $WS_CAPTION))
			$winPos = WinGetPos($GameTitle)
			WinMove($GameTitle,"",0,0,@DesktopWidth,@DesktopHeight)
			_WinAPI_ShowWindow($hWin,@SW_SHOW)
		EndIf
		Exit
	EndIf
WEnd