#!/bin/bash
#https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot

search=pacaur


#### via clean chroot

# CHROOT=$HOME/Documents/chroot
# arch-nspawn $CHROOT/root pacman -Syu
# makechrootpkg -c -r $CHROOT

# echo "signing the package"
# gpg --detach-sign $search*.tar.xz


# or via makepkg

makepkg --sign


#### cleaning up

echo "moving created files to repo"
mv $search*tar.xz ../../archmerge_repo_iso/x86_64/
mv $search*xz.sig ../../archmerge_repo_iso/x86_64/



echo "deleting unnecessary files"
find .  -not -name 'PKGBUILD' -not -name 'build-v*' -not -name '*.install' -not -name '*.cfg' -delete


echo "################################################################"
echo "###################    build done         ######################"
echo "################################################################"
