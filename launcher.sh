#!/bin/bash

export LD_PRELOAD="/usr/lib/pop-things/shop/libunion.so:/usr/lib/pop-things/shop/libexec.so"
export UNION_PRELOAD="/usr/lib/pop-things/shop/"

# Force GTK THEME

export DBUS_SESSION_BUS_ADDRESS=$(echo ${DBUS_SESSION_BUS_ADDRESS}| sed 's|/bus|/pop_bus|g')

export GTK_THEME=Pop-dark
io.elementary.appcenter ${@}
