;-------------------------------------系统功能-------------------------------------

;窗口关闭
!q::
  SendInput {Alt Down}{F4}{Alt Up}
return

;最小化
!m::
  WinMinimize A
return

;最大化
^+f::
  WinMaximize A
return

;清空回收站
^+del::
  FileRecycleEmpty
return

;显示桌面
^+d::
  SendInput {LWin Down}{d}{LWin Up}
return


;-------------------------------------ctrl系--------------------------------------

;输入法切换
!Space::
  SendInput {Ctrl Down}{Space down}{Ctrl up}{space up}
  SendInput {Ctrl Down}{Space down}{Ctrl up}{space up}
  SendInput {Ctrl Down}{Space down}{Ctrl up}{space up}
return

;复制
!c::
    SendInput {Ctrl Down}{c}{Ctrl Up}
return

;粘贴
!v::
  SendInput {Ctrl Down}{v}{Ctrl Up}
return

;重做
!y::
  SendInput {Ctrl Down}{y}{Ctrl Up}
return

;回退
!z::
  SendInput {Ctrl Down}{z}{Ctrl Up}
return

;剪切
!x::
  SendInput {Ctrl Down}{x}{Ctrl Up}
return

;保存
!s::
  SendInput {Ctrl Down}{s}{Ctrl Up}
return

;全选
!a::
  SendInput {Ctrl Down}{a}{Ctrl Up}
return

;查询
!f::
  SendInput {Ctrl Down}{f}{Ctrl Up}
return

;鼠标多文件选择
!LButton::
  SendInput {Ctrl Down}{LButton}{Ctrl Up}
return

;消息发送
!Enter::^Enter

;capslock to ctrl
;capslock::ctrl


;---------------------------------------app内键位定制-----------------------------------

;vistaswitcher任务切换
loop{
#IfWinActive, ahk_class VistaSwitcher_SwitcherWnd
    {
        j::down
        k::up
        l::right
        h::left
        return
    }
}

;xshell5中配置
loop{
#IfWinActive, ahk_class Xshell::MainFrame_0 
    {
        ;tab切换
        ;+j::SendInput {ctrl down}{shift down}{tab down}{ctrl up}{shift up}
        ;+k::SendInput {ctrl down}{tab down}{ctrl up}

        ;粘贴
        !v::SendInput {Shift down}{Insert down}{Shift Up}
        return
    }
}


;ctrl   ^
;shift  +
;alt    !

;PuTTY中配置
loop{
#IfWinActive, ahk_class PuTTY
    {
        ;新建window
        !p::SendInput {ctrl down}{a down}{ctrl up}{a up}{p down}

        ;粘贴
        !v::SendInput {Shift down}{Insert down}{Shift Up}

        ;关闭窗口
        !w::SendInput {ctrl down}{d down}

        ;搜索
        !f::SendInput {ctrl down}{a down}{ctrl up}{a up}{f down}

        ;切换窗口
        +j::SendInput {ctrl down}{a down}{ctrl up}{a up}{left down}
        +k::SendInput {ctrl down}{a down}{ctrl up}{a up}{right down}

        ;调整窗口顺序
        ^+j::SendInput {ctrl down}{a down}{ctrl up}{a up}{up down}
        ^+k::SendInput {ctrl down}{a down}{ctrl up}{a up}{down down}

        return
    }
}

;zoc中配置
loop{
#IfWinActive, ahk_class ZocMainWindow_(217255114)
    {
        ;tab切换
        +j::SendInput {ctrl down}{shift down}{tab down}{ctrl up}{shift up}
        +k::SendInput {ctrl down}{tab down}{ctrl up}

        ;+j::+^Tab
        ;+k::^Tab
        
        !o::!d
        !p::!r

        ;粘贴
        !v::SendInput {Shift down}{Insert down}{Shift Up}
        return
    }
}

;gvim中配置
loop{
#IfWinActive, ahk_class Vim
    {
        ;粘贴
        !v::SendInput {Shift down}{Insert down}{Shift up}
        ;复制
        !c::SendInput {ctrl down}{Insert down}{ctrl up}
        return
    }
}

;chrome中tab切换
loop{
#IfWinActive, ahk_class Chrome_WidgetWin_1
    {
        +j::SendInput {ctrl down}{shift down}{tab down}{ctrl up}{shift up}
        +k::SendInput {ctrl down}{tab down}{ctrl up}
        !w::SendInput {ctrl down}{w down}{ctrl up}
        !r::SendInput {ctrl down}{r down}{ctrl up}
        return
    }
}

;firefox中tab切换
loop{
#IfWinActive, ahk_class MozillaWindowClass
    {
        +j::SendInput {ctrl down}{shift down}{tab down}{ctrl up}{shift up}
        +k::SendInput {ctrl down}{tab down}{ctrl up}
        !w::SendInput {ctrl down}{w down}{ctrl up}
        !r::SendInput {ctrl down}{r down}{ctrl up}
        return
    }
}

;上下左右
loop{
#IfWinActive
    {
        !j::SendInput {down down}{down up}
        !k::SendInput {up down}{up up}
        !l::SendInput {right down}{right up}
        !h::SendInput {left down}{left up}
        return
    }
}


;--------------------------------------运行程序------------------------------------

^+i::
  Run C:\Program Files (x86)\ZTE\ZTE IM9\IM9.exe
return

^+o::
  Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
return

^+h::
  Run D:\ProgramFiles\Xshell\XshellPortable.exe
return

^+m::
  Run C:\Program Files (x86)\zMail\app\nw.exe
return

^+g::
  Run D:\ProgramFiles\SmartGit\bin\smartgit64.exe
return

^+l::
  Run D:\ProgramFiles\lingoes\Lingoes.exe
return
