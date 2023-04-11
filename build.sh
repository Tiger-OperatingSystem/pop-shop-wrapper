#!/bin/bash

mkdir -p pacote
(
  cd pacote
  
  cp ../launcher.sh usr/bin/io.elementary.appcenter.sh
  mkdir -p usr/bin/
  chmod +x usr/bin/io.elementary.appcenter.sh
  
  mkdir -p usr/lib/pop-things/shop/usr/share/themes
  cp -vR ../Pop-dark usr/lib/pop-things/shop/usr/share/themes
  
  mkdir DEBIAN
  
  (
    echo "Package: pop-shop-wrapper"
    echo "Priority: required"
    echo "Version: $(date +%y.%m.%d%H%M%S)"
    echo "Architecture: amd64"
    echo "Maintainer: Charles Santana, Natanael Barbosa Santos"
    echo "Depends: libflatpak0"
    echo "Description: Pop Shop implementation for Tiger OS"
    echo
  ) > "DEBIAN/control"
)

dpkg -b pacote
mv pacote.deb pop-shop-wrapper.deb
