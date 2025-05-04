; TODO:
; Place a mouse at the edge of the screen

#Requires AutoHotkey v2.0
#SingleInstance Force

#Include "scripts/Monitor.ahk"
#Include "config/config.ahk"

CoordMode "Mouse", "Screen"
DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")

global isMouseBad := false
global isShown := false
global isClickLeftAfterMoveMouse := false
global isClickRightAfterMoveMouse := false
global isClickMiddleAfterMoveMouse := false
global isClickAndDrag := false
global isFirstTime := true
global mouseLayerGui := Gui("+AlwaysOnTop -Caption +ToolWindow +E0x20")
global gridGui := Gui("+AlwaysOnTop -Caption +ToolWindow +E0x20")
global thirdStageGridGui := Gui("+AlwaysOnTop -Caption +ToolWindow +E0x20")
global stageOfChoice := 1
global currentMonitor := Monitor()


; CapsLock::Escape


#HotIf isShown
;=========================================================
Space::keyPressed(0, 0)
1::keyPressed(1, 1)
2::keyPressed(1, 2)
3::keyPressed(1, 3)
4::keyPressed(1, 4)
5::keyPressed(1, 5)
q::keyPressed(2, 1)
w::keyPressed(2, 2)
e::keyPressed(2, 3)
r::keyPressed(2, 4)
t::keyPressed(2, 5)
a::keyPressed(3, 1)
s::keyPressed(3, 2)
d::keyPressed(3, 3)
f::keyPressed(3, 4)
g::keyPressed(3, 5)
z::keyPressed(4, 1)
x::keyPressed(4, 2)
c::keyPressed(4, 3)
v::keyPressed(4, 4)
b::keyPressed(4, 5)

6::keyPressed(1, 1)
7::keyPressed(1, 2)
8::keyPressed(1, 3)
9::keyPressed(1, 4)
0::keyPressed(1, 5)
y::keyPressed(2, 1)
u::keyPressed(2, 2)
i::keyPressed(2, 3)
o::keyPressed(2, 4)
p::keyPressed(2, 5)
h::keyPressed(3, 1)
j::keyPressed(3, 2)
k::keyPressed(3, 3)
l::keyPressed(3, 4)
`;::keyPressed(3, 5)
n::keyPressed(4, 1)
m::keyPressed(4, 2)
,::keyPressed(4, 3)
.::keyPressed(4, 4)
/::keyPressed(4, 5)

Esc::reset()
;===========================================

#HotIf
CapsLock::mouseBad()

blank() {
}

mouseBad() {

    global isMouseBad
    if isMouseBad == false {
        reset()
        isMouseBad := true
    } 
    else {
        reset()
        return
    }
    
    global currentMonitor := Monitor()
    mouseLayerGuiRedraw()
}

mouseLayerGuiRedraw() {
    overlayWidth := currentMonitor.Width / 10
    overlayHeight := currentMonitor.Height / 20

    global mouseLayerGui
    mouseLayerGui.Destroy()
    mouseLayerGui := Gui("+AlwaysOnTop -Caption +ToolWindow +E0x20")
    mouseLayerGui.BackColor := backgroundColor
    mouseLayerGui.Add("Picture", "x0 y0 w" overlayWidth " h" overlayHeight, "images\Mause_Layer.png")
    WinSetTransColor(backgroundColor " " overlayTransparency, mouseLayerGui)

    mouseLayerGui.Show("x" currentMonitor.Left " y" currentMonitor.Top " w" overlayWidth " h" overlayHeight " NoActivate")
}

moveMouse() {
    global gridGui
    global isShown

    global currentMonitor
    overlayWidth := currentMonitor.Width
    overlayHeight := currentMonitor.Height

    if !isShown {
        gridGui.Destroy()
        gridGui := Gui("+AlwaysOnTop -Caption +ToolWindow +E0x20")
        gridGui.BackColor := backgroundColor
        ;gridGui.Add("Picture", "x" currentMonitor.Left " y" currentMonitor.Top " w" overlayWidth " h" overlayHeight, "images\Grid_Mouse_Bad_Transparent.png")
        gridGui.Add("Picture", "x0 y0 w" overlayWidth " h" overlayHeight, "images\Grid_Mouse_Bad_Transparent.png")
        WinSetTransColor(backgroundColor " " overlayTransparency, gridGui)

        gridGui.Show("x" currentMonitor.Left " y" currentMonitor.Top " w" overlayWidth " h" overlayHeight " NoActivate")
        isShown := true
        global isMouseBad := false
    } else {
        reset()
    }
}

moveAndClickLeftMouseButton() {
    global isClickLeftAfterMoveMouse := true
    moveMouse()
}
moveAndClickRightMouseButton() {
    global isClickRightAfterMoveMouse := true
    moveMouse()
}
moveAndClickMiddleMouseButton() {
    global isClickMiddleAfterMoveMouse := true
    moveMouse()
}
clickAndDrag() {
    global isClickAndDrag := true
    moveMouse()
}


keyPressed(keyRow, keyColumn) {
    global stageOfChoice
    static stageOneKey := [0, 0]
    static stageTwoKey := [0, 0]


    mouseLocation := [0, 0]
    monitorWidth := currentMonitor.Width
    monitorHeight := currentMonitor.Height

    if stageOfChoice == 1 {
        if keyRow == 0 { ;if key pressed is Space:
            mouseLocation := getMouseLocationAfterStageTwo(monitorWidth, monitorHeight, [1, 1], [1, 1])
            mouseLocation[1] += monitorWidth /2
            mouseLocation[2] += monitorHeight /2
            desideWhatToDoWithTheMouse(mouseLocation)
            return
        }

        stageOneKey := [keyRow, keyColumn]
        stageOfChoice := 2

        ; stageOneSubgridCoord := [0, 0]
        ; stageOneSubgridCoord[1] := currentMonitor.Left + getMouseLocationAfterStageTwo(currentMonitor.Width, currentMonitor.Height, stageOneKey, [1, 1])[1]
        ; stageOneSubgridCoord[2] := currentMonitor.Top + getMouseLocationAfterStageTwo(currentMonitor.Width, currentMonitor.Height, stageOneKey, [1, 1])[1]
        ; ; gridGui.Show("x" stageOneSubgridCoord[1] " y" stageOneSubgridCoord[2] " w" currentMonitor.Width /5 " h" currentMonitor.Height /4 " NoActivate")
        ; global gridGui
        ; gridGui.Destroy()
        ; gridGui := Gui()
        ; gridGui.Add("Picture", "w" currentMonitor.Width /5 " h" currentMonitor.Height /4)
        ; gridGui.Value := "*Crop " stageOneSubgridCoord[1] " " stageOneSubgridCoord[2] " " currentMonitor.Width /5 " " currentMonitor.Height /4 " images\Grid_Mouse_Bad_Transparent.png"
        ; gridGui.Show()
        return
    }
    else if stageOfChoice == 2 {
        if keyRow == 0 { ;if key pressed is Space:
            mouseLocation := getMouseLocationAfterStageTwo(monitorWidth, monitorHeight, stageOneKey, [1, 1])
            mouseLocation[1] += monitorWidth /10 ;add half of the cell
            mouseLocation[2] += monitorHeight /8 ;add half of the cell
            desideWhatToDoWithTheMouse(mouseLocation)
            return
        }

        stageTwoKey := [keyRow, keyColumn]

        ; Add a subgrid showing
        gridGui.Hide()
        addSubGrid(stageOneKey, stageTwoKey, currentMonitor.Width / 25, currentMonitor.Height / 16)

        stageOfChoice := 3
        return
    }
    else if stageOfChoice == 3 {
        mouseLocation := getMouseLocationAfterStageTwo(monitorWidth, monitorHeight, stageOneKey, stageTwoKey)
        if keyRow == 0 { ; Space
            mouseLocation[2] += monitorHeight / 32 ; 4/4/2 = half of the last grid iteration
            mouseLocation[1] += monitorWidth / 50 ; 5/5/2
        } else {
            mouseLocation[2] += takeSubSection(monitorHeight /16, 4, keyRow -1)
            mouseLocation[1] += takeSubSection(monitorWidth /25, 5, keyColumn -1)

            mouseLocation[2] += monitorHeight / 128 ; 4/4/4/2 
            mouseLocation[1] += monitorWidth / 250 ; 5/5/5/2
        }
    }

    desideWhatToDoWithTheMouse(mouseLocation)
}
        


desideWhatToDoWithTheMouse(mouseLocation := [0, 0]) {
    if isClickAndDrag {
        Click("Down")
            Sleep 100
            MouseMove(mouseLocation[1], mouseLocation[2])
            Sleep 100
            Click("Up")
            ; MouseGetPos &mouseX, &mouseY
            ; MouseClickDrag("Left", mouseX, mouseY, mouseLocation[1], mouseLocation[2], 2)

            ;clean up:
            reset()
            mouseBad()
            return
    }

    MouseMove(mouseLocation[1], mouseLocation[2])

        if isClickLeftAfterMoveMouse {
            Click()
        }
        else if isClickRightAfterMoveMouse {
            Click("Right")
        }
        else if isClickMiddleAfterMoveMouse {
            Click("Middle")
        }

    ;clean up:
        reset()
        mouseBad()
}

takeSubSection(overallLength, totalNumberOfSections, sectionNumber) {
    return overallLength / totalNumberOfSections * sectionNumber
}
getMouseLocationAfterStageTwo(monitorWidth, monitorHeight, stageOneKey, stageTwoKey) {
    mouseLocation := [0, 0]
    mouseLocation[2] := currentMonitor.Top
    mouseLocation[1] := currentMonitor.Left

    mouseLocation[2] += takeSubSection(monitorHeight, 4, stageOneKey[1] -1) + takeSubSection(monitorHeight /4, 4, stageTwoKey[1] -1)
    mouseLocation[1] += takeSubSection(monitorWidth, 5, stageOneKey[2] -1) + takeSubSection(monitorWidth /5, 5, stageTwoKey[2] -1)

    return mouseLocation
}

addSubGrid(stageOneKey, stageTwoKey, overlayWidth, overlayHeight) {
    mouseLocation := [0, 0]
    mouseLocation := getMouseLocationAfterStageTwo(currentMonitor.Width, currentMonitor.Height, stageOneKey, stageTwoKey)

    global thirdStageGridGui
    thirdStageGridGui.Destroy()
    thirdStageGridGui := Gui("+AlwaysOnTop -Caption +ToolWindow +E0x20")
    thirdStageGridGui.BackColor := backgroundColor
    thirdStageGridGui.Add("Picture", "x0 y0 w" overlayWidth " h" overlayHeight, "images\4x3_Grid.png")
    WinSetTransColor(backgroundColor " " overlayTransparency, thirdStageGridGui)

    thirdStageGridGui.Show("x" mouseLocation[1] " y" mouseLocation[2] " w" overlayWidth " h" overlayHeight " NoActivate")
    
}

switchToMonitor(index) {
    reset()
    global isMouseBad := true
    global currentMonitor := Monitor(index)
    mouseLayerGuiRedraw()
}


reset() {
    global isMouseBad := false
    global mouseLayerGui
    mouseLayerGui.Hide()

    global isShown := false
    global gridGui
    gridGui.Hide()

    global thirdStageGridGui
    thirdStageGridGui.Hide()

    global isClickLeftAfterMoveMouse := false
    global isClickRightAfterMoveMouse := false
    global isClickMiddleAfterMoveMouse := false
    global isClickAndDrag := false
    global stageOfChoice := 1

    global currentMonitor := Monitor()
}

; MonitorCount := MonitorGetCount()
; MonitorPrimary := MonitorGetPrimary()
; MsgBox "Monitor Count:`t" MonitorCount "`nPrimary Monitor:`t" MonitorPrimary
; Loop MonitorCount
; {
;     MonitorGet A_Index, &L, &T, &R, &B
;     MonitorGetWorkArea A_Index, &WL, &WT, &WR, &WB
;     MsgBox
;     (
;         "Monitor:`t#" A_Index "
;         Name:`t" MonitorGetName(A_Index) "
;         Left:`t" L " (" WL " work)
;         Top:`t" T " (" WT " work)
;         Right:`t" R " (" WR " work)
;         Bottom:`t" B " (" WB " work)"
;     )
; }
