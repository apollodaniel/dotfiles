#!/bin/sh
i3status --config ~/.config/i3status/config 2>/dev/null | while IFS= read -r line; do
    case "$line" in
        '{"version":'*)
            echo '{"version":1,"click_events":true}'
            continue
            ;;
        '['|'[]')
            echo "$line"
            continue
            ;;
    esac
    comma=""
    stripped="$line"
    case "$line" in
        ,*) comma=","; stripped="${line#,}" ;;
    esac
    scene=$(/home/apollo/.local/bin/obs-scene.sh 2>/dev/null)
    obs_json="{\"full_text\":\"${scene}\",\"color\":\"#ff79c6\"}"
    twitch=$(/home/apollo/.local/bin/twitch-viewers.sh 2>/dev/null)
    twitch_json="{\"full_text\":\"${twitch}\",\"color\":\"#9146ff\"}"
    clipshow_json="{\"full_text\":\" [CLIP] \",\"name\":\"clipshow\",\"color\":\"#8be9fd\"}"
    clipclear_json="{\"full_text\":\" [CLR] \",\"name\":\"clipclear\",\"color\":\"#f8f8f2\"}"
    bt_json="{\"full_text\":\" [BT] \",\"name\":\"bluetooth\",\"color\":\"#FD971F\"}"
    inner="${stripped%]}"
    echo "${comma}[${clipshow_json},${clipclear_json},${twitch_json},${obs_json},${inner#[},${bt_json}]"
done
