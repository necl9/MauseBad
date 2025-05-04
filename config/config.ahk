; Ergonomic config:

global overlayTransparency := 150
global backgroundColor := "dfbdbc"


; Mouse Layer hotkeys:
; [If you are adding a new key, remember to comment that key among the 'blanks' at the bottom. Or it will cause an error
;=========================================================
#HotIf isMouseBad

f::moveMouse()
c::Click()
w::moveAndClickLeftMouseButton()
r::moveAndClickRightMouseButton()
e::moveAndClickMiddleMouseButton()
q::clickAndDrag()

u::Click("WheelUp")
d::Click("WheelDown")
s & u::Click("WheelUp, 8")
s & d::Click("WheelDown, 8")
;w & r::Click("WheelRight")
;w & l::Click("WheelLeft")

h::Left
j::Down
k::Up
l::Right

Tab::switchToMonitor(currentMonitor.Index +1)
1::switchToMonitor(1)
2::switchToMonitor(2)
3::switchToMonitor(3)
4::switchToMonitor(4)
5::switchToMonitor(5)
6::switchToMonitor(6)
7::switchToMonitor(7)
8::switchToMonitor(8)
9::switchToMonitor(9)

Esc::reset()

; Disabling the non-used keys in the mouse layer:
;=========================================================
Space::blank()
;1::blank()
;2::blank()
;3::blank()
;4::blank()
;5::blank()
;q::blank()
;w::blank()
;e::blank()
;r::blank()
;t::blank()
a::blank()
s::blank()
;d::blank()
;f::blank()
g::blank()
z::blank()
x::blank()
;c::blank()
v::blank()
b::blank()

;6::blank()
;7::blank()
;8::blank()
;9::blank()
;0::blank()
y::blank()
;u::blank()
i::blank()
o::blank()
p::blank()
;h::blank()
;j::blank()
;k::blank()
;l::blank()
`;::blank()
n::blank()
;m::blank()
,::blank()
.::blank()
/::blank()

;=========================================================
