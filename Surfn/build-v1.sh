#!/bin/bash

#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot


CHROOT=$HOME/Documents/chroot
arch-nspawn $CHROOT/root pacman -Syu
makechrootpkg -c -r $CHROOT

echo "signing the package"
gpg --detach-sign surfn-*.tar.xz

echo "moving created files to repo"
mv surfn-*tar.xz ../../archmerge_repo_iso/x86_64/
mv surfn-*xz.sig ../../archmerge_repo_iso/x86_64/

echo "deleting unnecessary files"
find .  -not -name 'PKGBUILD' -not -name 'build-v*' -delete


echo "################################################################"
echo "###################    build done         ######################"
echo "################################################################"
