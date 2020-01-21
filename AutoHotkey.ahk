;ctrl   ^
;shift  +
;alt    !


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

;PuTTY-tmux中配置
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

        ;tab前后切换
        +j::SendInput {ctrl down}{a down}{ctrl up}{a up}{j down}
        +k::SendInput {ctrl down}{a down}{ctrl up}{a up}{k down}

        ;调整窗口顺序
        ^+j::SendInput {ctrl down}{a down}{ctrl up}{a up}{h down}
        ^+k::SendInput {ctrl down}{a down}{ctrl up}{a up}{l down}

        ;copy-mode
        ^+u::SendInput {ctrl down}{a down}{ctrl up}{a up}{[ down}
        ^+p::SendInput {ctrl down}{a down}{ctrl up}{a up}{] down}

        ;启动关闭鼠标模式
        !1::SendInput {ctrl down}{a down}{ctrl up}{a up}{- down}
        !2::SendInput {ctrl down}{a down}{ctrl up}{a up}{= down}

        ;panel切换
        ^!k::SendInput {ctrl down}{a down}{ctrl up}{a up}{up down}
        ^!j::SendInput {ctrl down}{a down}{ctrl up}{a up}{down down}
        ^!h::SendInput {ctrl down}{a down}{ctrl up}{a up}{left down}
        ^!l::SendInput {ctrl down}{a down}{ctrl up}{a up}{right down}

        ;切分窗口
        ^+\::SendInput {ctrl down}{a down}{ctrl up}{a up}{\ down}
        ^+BackSpace::SendInput {ctrl down}{a down}{ctrl up}{a up}{" down}

        ;切换
        ^+h::SendInput {ctrl down}{a down}{ctrl up}{a up}{s down}

        ;命令行
        ^+;::SendInput {ctrl down}{a down}{ctrl up}{a up}{: down}

        ;直接切换窗口
        ^+1::SendInput {ctrl down}{a down}{ctrl up}{a up}{1 down}
        ^+2::SendInput {ctrl down}{a down}{ctrl up}{a up}{2 down}
        ^+3::SendInput {ctrl down}{a down}{ctrl up}{a up}{3 down}
        ^+4::SendInput {ctrl down}{a down}{ctrl up}{a up}{4 down}
        ^+5::SendInput {ctrl down}{a down}{ctrl up}{a up}{5 down}
        ^+6::SendInput {ctrl down}{a down}{ctrl up}{a up}{6 down}
        ^+7::SendInput {ctrl down}{a down}{ctrl up}{a up}{7 down}
        ^+8::SendInput {ctrl down}{a down}{ctrl up}{a up}{8 down}
        ^+9::SendInput {ctrl down}{a down}{ctrl up}{a up}{9 down}

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

	;调整窗口顺序
	^+j::SendInput {ctrl down}{shift down}{pgup down}{ctrl up}{shift up}
	^+k::SendInput {ctrl down}{shift down}{pgdn down}{ctrl up}{shift up}

	;新建tab
	!p::SendInput {ctrl down}{t down}{ctrl up}

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

^+g::
  Run D:\ProgramFiles\SmartGit\bin\smartgit.exe
return

^+l::
  Run D:\ProgramFiles\lingoes\Lingoes.exe
return

