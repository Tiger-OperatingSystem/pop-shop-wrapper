#!/bin/bash

export HERE=$(dirname "${1}")
export LD_PRELOAD="${HERE}/libunion.so:${HERE}/libexec.so"
export UNION_PRELOAD="/usr/lib/pop-things/shop/"

# Force GTK THEME

eval $(dbus-launch --auto-syntax)

export GTK_THEME=Pop-dark
io.elementary.appcenter ${@}
