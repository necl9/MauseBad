class Monitor {
    Index := 1

    Left := 0
    Right := 0
    Top := 0
    Bottom := 0

    Width := 0
    Height := 0

    __New(index := 0) {
        if index == 0 {
            focusedMonitorIndex := this.getFocusedMonitorIndex()
        }
        else if index > MonitorGetCount() {
            focusedMonitorIndex := 1
        }
        else focusedMonitorIndex := index

        MonitorGet focusedMonitorIndex, &monitorLeft, &monitorTop, &monitorRight, &monitorBottom

        this.Index := focusedMonitorIndex
        this.Left := monitorLeft
        this.Top := monitorTop
        this.Right := monitorRight
        this.Bottom := monitorBottom
        this.Width := monitorRight - monitorLeft
        this.Height := monitorBottom - monitorTop
    }

    getFocusedMonitorIndex() {
        MouseGetPos &mouseX, &mouseY

        count := MonitorGetCount()
        Loop count {
            MonitorGet A_Index, &Left, &Top, &Right, &Bottom
            mon := MonitorGet(A_Index)
            if (mouseX >= Left && mouseX < Right && mouseY >= Top && mouseY < Bottom)
                return A_Index
        }
        return 0  ; Not found (unlikely unless off-screen)
    }
}
