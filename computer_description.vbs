Set WshNetwork = WScript.CreateObject("WScript.Network")
  
'strComputer = Wscript.Arguments.Item(0)
strDescription = Inputbox("Enter Description:")
  
Set Obj= GetObject("winmgmts:\\" & strComputer).InstancesOf("Win32_OperatingSystem")
For Each x In Obj 
   x.Description = strDescription
   x.Put_
Next
  
WScript.Quit

