#!/run/current-system/sw/bin/bash

# Toggle the microphone mute state
pamixer --default-source --toggle-mute

# Check the status of the Capture device
MIC_STATUS=$(amixer get Capture | grep '\[off\]')

if [ -n "$MIC_STATUS" ]; then
  # Microphone is off, turn off the light
  echo 1 | sudo tee /sys/class/leds/platform::micmute/brightness
else
  # Microphone is on, turn on the light
  echo 0 | sudo tee /sys/class/leds/platform::micmute/brightness
fi

# Refresh i3status
$refresh_i3status
