#!/run/current-system/sw/bin/bash

mute_status=$(pamixer --source 55 --get-mute)

if [ "$mute_status" = "true" ]; then
    echo '{"text": "", "class": "muted", "tooltip": "Microphone is muted"}'
else
    echo '{"text": "", "class": "unmuted", "tooltip": "Microphone is unmuted"}'
fi

