#!/bin/bash
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot

search=obkey



#### via clean chroot

CHROOT=$HOME/Documents/chroot
arch-nspawn $CHROOT/root pacman -Syu
makechrootpkg -c -r $CHROOT

echo "signing the package"
gpg --detach-sign $search*.tar.xz


# or via makepkg

#makepkg --sign


#### cleaning up

echo "moving created files to repo"
mv $search*tar.xz ../../archmerge_repo_iso/x86_64/
mv $search*xz.sig ../../archmerge_repo_iso/x86_64/



echo "deleting unnecessary files"
find .  -not -name 'PKGBUILD' -not -name '*.hook' -not -name '*.conf' -not -name 'LICENSE' -not -name 'build-v*' -not -name 'modprobe.d*' -not -name '*.install' -not -name '*.patch' -not -name '*.png' -not -name '*.jpg' -not -name '*.cfg' -not -name '*.desktop' -delete


echo "################################################################"
echo "###################    build done         ######################"
echo "################################################################"