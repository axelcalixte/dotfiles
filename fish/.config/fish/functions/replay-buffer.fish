function replay-buffer
    if not command -q obs-cmd; or not command -q zenity
        exit 1
    end

    if obs-cmd info &>/dev/null
        obs-cmd replay (zenity --list  --column "command"  --text (obs-cmd replay status | tail -1) "save" "toggle")
    end
end
