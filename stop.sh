#!/bin/bash
PWD="$(dirname "$0")"
export XAUTHORITY=$PWD/.Xauthority
killall -q -u $USER Xvfb
killall -q -u $USER x11vnc
killall -q -u $USER plexamp
killall -q -u $USER butt
killall -q -u $USER dbus-daemon
killall -q -u $USER pulseaudio
rm $XAUTHORITY 2>/dev/null
