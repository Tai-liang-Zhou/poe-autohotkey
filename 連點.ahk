;;������ AutoHotKey�禡 ShowBanner(x) ���ͼ��D�e�� 0.5��
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ShowBanner(x)
{
    Gui, -Caption +ToolWindow +LastFound +AlwaysOnTop
	
    Trans := 255
    Gui, Add, Text,, %x%
    GuiControl, Text, String, % Text
	Gui, Show, center xcenter NoActivate, MyTransparentBanner
    WinSet, Transparent, %Trans%, MyTransparentBanner
    Sleep 500
    
    Loop
    {
        if(Trans <= 0)
        {
            Trans := 0
            WinSet, Transparent, %Trans%, MyTransparentBanner
            break
        }
                
        WinSet, Transparent, %Trans%, MyTransparentBanner
        Trans := Trans - 5
        Sleep, 10
    }
    Gui, Destroy
    return
}


;������ �Ȱ�Autohotkey���\�� Mouse(L)+s
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~LButton & s::
	Suspend ,Toggle 
	ShowBanner("AutoHotKey �Ȱ�/�^�_")
return

;������ ���s���JAutohotkey���}��ahk Mouse(L)+r
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~LButton & r::
	ShowBanner("AutoHotKey ���s���J�}��")
	reload
return

;������ŪTXT�ɮ׹�����m�۰��I���ƹ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~LButton & a::
  CoordMode, Mouse, Screen
  XArray := Object()
  XArray[j] := A_LoopField
  XArray[j, k] := A_LoopReadLine               

  Loop, Read, C:\MyAutoClick.txt
  {
      XArrayCount += 1
      XArray[XArrayCount] := A_LoopReadLine
 }

  XArrayCount/= 2
 
  Sleep, 10
  Loop
  {
        nowIndx := 1
       Loop %XArrayCount%
      {
          nowX := XArray[nowIndx]
          newY := XArray[nowIndx+1]
          
          mousemove, %nowX%,%newY%,50,
          MouseClick
		  Sleep,10
          nowIndx += 2
      }
  }
return

;���������o�ƹ��y��
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~LButton & g::
CoordMode, Mouse, Screen   
MouseGetPos, xpos, ypos,,,1
FileAppend,                
(
%xpos%
%ypos%
),C:\MyAutoClick.txt ;
ToolTip, ���o: X%xpos% Y%ypos%
return

;�������M���ɮ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~LButton & c::
FileDelete, C:\MyAutoClick.txt
FileAppend, ,C:\MyAutoClick.txt
return