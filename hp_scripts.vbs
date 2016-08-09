http://community.hpe.com/t5/Unified-Functional-Testing/License-Server-not-available-for-HP-UFT-12-5-But-working-fine/td-p/6780607



'' assuming HP started a RealTick application so Yperms Login form is displayed.
if Dialog("RealTickLoginWindow").Exist(1) then
	Dialog("RealTickLoginWindow") 
	Dialog("RealTickLoginWindow").Click()
	Dialog("RealTickLoginWindow").WinComboBox("Locale:").Select("QARTQA")
	Dialog("RealTickLoginWindow").WinEdit("User Name:").Set("ADEMIN")
	Dialog("RealTickLoginWindow").WinEdit("Domain:").Set("SBDEMO")
	Dialog("RealTickLoginWindow").winedit("Password:").Set("tal")
	Dialog("RealTickLoginWindow").WinButton("OK").Click()
	
	'Window("RealTick").WaitProperty "regexwndtitle", "REALTICK", 1000
	
	while Window("RealTick").Dialog("RealTick").Exist(1) = false
		wait 1
	wend
	
	while Window("RealTick").Dialog("RealTick").Exist(1) = true
		wait 1
	wend
		
	while Window("RealTick").Dialog("RealTick").WinObject("Internet Explorer_Server").Exist(1) = true
		wait 1
	wend
		
end if



'-----------------------------------
MIN_WAIT = 2
MAX_WAIT = 300
set wRT = Window("micclass:=Window","regexpwndclass:=REALTICK")
set wRTMenu = wRT.WinObject("micclass:=WinObject","window id:=59398")

l = -1: t = -1: r = -1: b = -1  'reset variables
ret = wRTMenu.GetTextLocation("Trading", l, t, r, b)

wRTMenu.Click  l+3, t+2


Set desc = Description.Create  
Set WinChildren = Window("RealTick").Window("Window").ChildObjects(desc)

' The following counts every open window on the desktop
for i = 0 to WinChildren.Count - 1
       winText = WinChildren(i).GetVisibleText
       if instr(1, winText, "Order Entry") > 0 then
       	l = -1: t = -1: r = -1: b = -1   'reset variables
        ret = WinChildren(i).GetTextLocation("Order Entry", l, t, r, b)
       	WinChildren(i).Click l+3, t+2
       end If
next


'-------------- click order alert ------------------------------------------------'
set wRTDlg = wRT.Dialog("micclass:=Dialog","nativeclass:=#32770","text:=Order Entry Properties")
'--------
wRTDlg.WinList("micclass:=WinList","window id:=103", "nativeclass:=ListBox").Select "Order Alerts"
wRTDlg.WinButton("micclass:=WinButton","nativeclass:=Button","text:=New").Click


'-----------------------------------------------------

MIN_WAIT = 2
MAX_WAIT = 300


l = -1: t = -1: r = -1: b = -1  'reset variables
ret = Window("RealTick").WinObject("Menu").GetTextLocation("Design", l, t, r, b)

Window("RealTick").WinObject("Menu").Click  l+3, t+2


Set desc = Description.Create  
Set WinChildren = Window("RealTick").Window("Window").ChildObjects(desc)

' The following counts every open window on the desktop
for i = 0 to WinChildren.Count - 1
       winText = WinChildren(i).GetVisibleText
       if instr(1, winText, "Trade Manager") > 0 then
       	l = -1: t = -1: r = -1: b = -1   'reset variables
        ret = WinChildren(i).GetTextLocation("Trade Manager", l, t, r, b)
       	WinChildren(i).Click l+3, t+2
       end If
next


Window("RealTick").Dialog("Trade Manager Setup").WinRadioButton("Orders").Set
Window("RealTick").Dialog("Trade Manager Setup").WinRadioButton("Single Line Summary").Set
Window("RealTick").Dialog("Trade Manager Setup").WinButton("OK").Click

'-----------------------------------------------------------------------------------------
set winz 		= Window("RealTick")
set winy 		= winz.Window("micclass:=Window","regexpwndclass:=AfxFrameOrView120")
set winx 		= winy.WinTreeView("micclass:=WinTreeView","regexpwndclass:=SysTreeView32")

set winyRClk 	= winy.WinObject("micclass:=WinObject","regexpwndclass:=AfxWnd120")
set winyRClkWM 	= WinMenu("micclass:=WinMenu","menuobjtype:=3")
'-----------------------------------------------------------------------------------------

winy.Click
wait MIN_WAIT

winyRClk.Click 150, 123, micRightBtn
winyRClkWM.Select "Find Account...	F3"


'-----------------------------------------------------------------------------------------
set winzFind = winz.Dialog("micclass:=Dialog","text:=Find Account","nativeclass:=#32770")
'-----------------------------------------------------------------------------------------


winzFind.WinEdit("micclass:=WinEdit","attached text:=Search for Text:").SetSelection 0,7
winzFind.WinEdit("micclass:=WinEdit","attached text:=Search for Text:").Set "ADEMIN5"
winzFind.WinButton("micclass:=WinButton","window id:=1008").Click
winzFind.WinButton("micclass:=WinButton","text:=OK").Click







