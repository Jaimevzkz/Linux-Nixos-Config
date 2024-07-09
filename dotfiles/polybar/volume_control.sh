# ~/.config/polybar/volume-pipewire.sh
#!/usr/bin/env bash

# Fetch the current volume and mute status
VOLUME=$(pamixer --get-volume)
MUTE=$(pamixer --get-mute)

# Output the volume or muted status
if [ "$MUTE" = "true" ]; then
  echo "muted"
else
  echo "${VOLUME}%"
fi

