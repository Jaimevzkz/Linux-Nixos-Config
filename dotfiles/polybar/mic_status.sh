#!/usr/bin/env bash

# Check if the microphone is muted or unmuted
mic_status=$(pamixer get Capture | grep '\[on\]')

if [ -z "$mic_status" ]; then
  echo "󰍭"
else
   echo "󰍬"
fi


