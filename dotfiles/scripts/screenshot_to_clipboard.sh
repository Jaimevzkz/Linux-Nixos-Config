#!/usr/bin/env bash
#scrot -s /tmp/screenshot.png && xclip -selection clipboard -t image/png -i /tmp/screenshot.png


export DISPLAY=:0
export XAUTHORITY=/run/user/1000/gdm/Xauthority

echo "Script executed" >> /tmp/i3_screenshot.log

# Run scrot with a selector and wait for it to complete
scrot -s /tmp/screenshot.png && xclip -selection clipboard -t image/png -i /tmp/screenshot.png

echo "Screenshot taken and copied to clipboard" >> /tmp/i3_screenshot.log

