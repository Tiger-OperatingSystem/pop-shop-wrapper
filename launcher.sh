#!/bin/bash

export LD_PRELOAD="/usr/lib/pop-things/shop/libunion.so:/usr/lib/pop-things/shop/libexec.so"
export UNION_PRELOAD="/usr/lib/pop-things/shop/"

# Force GTK THEME

export DBUS_SESSION_BUS_ADDRESS=unix:abstract=/tmp/dbus-tytL37m5bn,guid=666fd316562236143901baf563c59005
export DBUS_SESSION_BUS_PID=36
export DBUS_SESSION_BUS_WINDOWID=6291457

export GTK_THEME=Pop-dark
io.elementary.appcenter.orig ${@}
