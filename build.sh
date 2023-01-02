#!/bin/bash

mkdir -p pacote
(
  cd pacote
  wget $(wget -q -O - https://apt-origin.pop-os.org/release/dists/jammy/main/binary-amd64/Packages                       | \
                      grep "^Filename: " | grep -E "libgranite-common_|libgranite6_|python3-repolib_|repoman_|pop-shop_" | \
                                                             sed 's|^Filename: |https://apt-origin.pop-os.org/release/|' | \
                                                                                                                   xargs )
  for file in ./*.deb;do
    dpkg -x ${file} . 
    rm ${file}
  done

  mkdir -p usr/lib/pop-things/shop/usr/share/themes
  cp -vR ../Pop-dark usr/lib/pop-things/shop/usr/share/themes
  cp -vR ../libexec.so  usr/lib/pop-things/shop/
  cp -vR ../libunion.so usr/lib/pop-things/shop/
  
  mv  usr/bin/io.elementary.appcenter usr/bin/io.elementary.appcenter.orig
  cp ../launcher.sh usr/bin/io.elementary.appcenter
  
  chmod +x usr/bin/io.elementary.appcenter
  
  mkdir DEBIAN
  
  (
    echo "Package: pop-shop-wrapper"
    echo "Priority: required"
    echo "Version: $(date +%y.%m.%d%H%M%S)"
    echo "Architecture: amd64"
    echo "Maintainer: Natanael Barbosa Santos"
    echo "Depends: xfce4, yad, xfce4-genmon-plugin, xfce4-pulseaudio-plugin, xfce4-whiskermenu-plugin, xfce4-battery-plugin, wmctrl"
    echo "Description: Pop Shop implementation for Tiger OS"
    echo
  ) > "DEBIAN/control"
)

dpkg -b pacote
mv pacote.deb pop-shop-wrapper.deb
