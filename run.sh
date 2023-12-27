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

cd $PWD
[ -e "$PWD/butt" ] || (echo "downloading danielnoethen.de/butt..." && curl "https://danielnoethen.de/butt/release/0.1.40/butt-0.1.40-x86_64.AppImage" -o butt 2>/dev/null && chmod +x butt)
eval "$($PWD/xinit.sh)"
xvfb-run -l --server-args="-screen 0 1024x768x24" -f $XAUTHORITY fluxbox 2>/dev/null &
export DISPLAY=:99
until [ -e $XAUTHORITY ]; do
    sleep 1
done
flatpak run com.plexamp.Plexamp &
$PWD/butt &
sleep 5
$PWD/start-plexamp.py
$PWD/butt -s
x11vnc -q -nopw -forever -autoport 5900
