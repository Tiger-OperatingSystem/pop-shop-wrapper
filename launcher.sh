#!/bin/bash

export LD_PRELOAD="/usr/lib/pop-things/shop/libunion.so:/usr/lib/pop-things/shop/libexec.so"
export UNION_PRELOAD="/usr/lib/pop-things/shop/"

# Force GTK THEME

export $(dbus-launch)
/usr/libexec/gvfsd &

export GTK_THEME=Pop-dark
io.elementary.appcenter ${@}
