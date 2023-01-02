#!/bin/bash

export LD_PRELOAD="/usr/lib/pop-things/shop/libunion.so:/usr/lib/pop-things/shop/libexec.so"
export UNION_PRELOAD="/usr/lib/pop-things/shop/"

# Force GTK THEME

eval $(dbus-launch --auto-syntax)

export GTK_THEME=Pop-dark
io.elementary.appcenter.orig ${@}
