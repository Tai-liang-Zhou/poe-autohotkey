q::Command()
f4::trade()
f5::checkItem()
f6::loop_click()
f7::warehouse()
;f4 交易
;f5 檢查交易
;f11 斷開loop


Command(){
IfWinActive, Path of Exile
	{
		BlockInput On
		send 2345
		BlockInput Off
		return
	}
}



trade(){
  IfWinActive, Path of Exile
  nowIndx := 0
  Loop 12
  {	   
       nowIndy := 0
       Loop 5
      {
          nowX := 1275 + (nowIndx * 50)
          newY := 650 + (nowIndy * 50)
          send {ctrl down}
          Click %nowX%,%newY%
          nowIndy += 1
          if (GetKeyState("f11")) ; Looks to see if Shift is pressed
        	break 
      }
      nowIndx += 1
      if (GetKeyState("f11")) ; Looks to see if Shift is pressed
        	break 
  }
  send {ctrl up}
  return
}

checkItem(){
IfWinActive, Path of Exile
  nowIndy := 0
  Loop 5
  {	   
       nowIndx := 0
       Loop 12
      {
          nowX := 325 + (nowIndx * 50)
          newY := 250 + (nowIndy * 50)
          mousemove, %nowX%,%newY%
          nowIndx += 1
      }
      nowIndy += 1
  }
  mousemove, 375,840
  MouseClick
  return
}


loop_click(){
	IfWinActive, Path of Exile
	CoordMode, Mouse, Screen   
	MouseGetPos, xpos, ypos
	loop
	{
		mousemove, %xpos%,%ypos%
		send {ctrl down}
		MouseClick
		if (GetKeyState("f11")) ; Looks to see if Shift is pressed
        	break 
	}
	send {ctrl up}
	return
}

 warehouse(){
  IfWinActive, Path of Exile
  nowIndx := 0
  Loop 12
  {	   
       nowIndy := 0
       Loop 12
      {
          nowX := 50 + (nowIndx * 50)
          newY := 220 + (nowIndy * 50)
          send {ctrl down}
          Click %nowX%,%newY%
          nowIndy += 1
          if (GetKeyState("f11")) ; Looks to see if Shift is pressed
        	break 
      }
      nowIndx += 1
      if (GetKeyState("f11")) ; Looks to see if Shift is pressed
        	break 
  }
  send {ctrl up}
  return
 }

~LButton & g::
CoordMode, Mouse, Screen   
MouseGetPos, xpos, ypos
ToolTip, 取得: X%xpos% Y%ypos%,2
return
