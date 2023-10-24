#!usr/bin/bash

#########################################
#				Variables				#
#########################################
xorgpkg="	xorg-server 
			xorg-xinit 
			xorg-xset 
			xorg-xsetroot 
			xorg-xrandr 
			xorg-xrdb	"

impPackages="	bspwm 
				sxhkd 
				polybar 
				picom
				gnu-free-fonts
				git 
				github-cli	"

addPackages="	dmenu
				ranger
				kitty
				feh
				fish	"
				
fonts="	adobe-source-code-pro-fonts	"


#########################################
#				Functions				#
#########################################
updatePacman(){
	echo "Update pacman repo"
	sudo pacman --noconfirm -Syu
}

installPackages(){
	echo "Install xorg"
	#sudo pacman --noconfirm -S xorg xorg-init
	sudo pacman --noconfirm -S $xorgpkg
	cp .xinitrc ../

	echo "Install other packages"
	sudo pacman --noconfirm -S $impPackages $addPackages $fonts
	
	chsh -s $(which fish)
}

installYay(){
	echo "Install yay"
	git clone https://aur.archlinux.org/yay.git 
	cd ./yay || exit
	makepkg -sir --noconfirm
	cd ..
	rm -rf yay
}

installYayPackages(){
	InstallYay
	yay --noconfirm -S betterlockscreen
}


#########################################
#				Installing				#
#########################################
updatePacman
installPackages


