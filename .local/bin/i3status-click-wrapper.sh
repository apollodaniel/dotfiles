#!/bin/bash
/home/apollo/.local/bin/i3status-obs.sh &
STATUS_PID=$!
trap "kill $STATUS_PID 2>/dev/null" EXIT
while IFS= read -r click; do
    case "$click" in
        *'"name":"clipshow"'*)
            rofi -modi "clipboard:greenclip print" -show clipboard -theme ~/.config/rofi/clipboard.rasi &
            ;;
        *'"name":"clipclear"'*)
            greenclip clear &
            ;;
        *'"name":"bluetooth"'*)
            rofi-bluetooth -theme ~/.config/rofi/bluetooth.rasi &
            ;;
    esac
done
