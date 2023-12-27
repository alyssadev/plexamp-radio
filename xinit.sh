#!/bin/sh
dbus-launch | while read p; do echo export $p; done
pulseaudio --start
