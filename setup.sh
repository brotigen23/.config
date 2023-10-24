#!usr/bin/bash

########################################
#				Variables
########################################
xorgpkg="	xorg-server 
			xorg-xinit 
			xorg-xset 
			xorg-xsetroot 
			xorg-xrandr 
			xorg-xrdb	"

packages="	bspwm 
			xhkd 
			dmenu 
			polybar 
			picom 
			kitty 
			gnu-free-fonts 
			feh 
			git 
			github-cli	
			fish	"


########################################
#				Functions
########################################
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
	sudo pacman --noconfirm -S $packages 
	
	chsh -s (which fish)
}

installYay(){
	echo "Install yay"
	git clone https://aur.archlinux.org/yay.git 
	cd ./yay || exit
	makepkg -sir --noconfirm
	cd ..
	rm -rf yay
}

installBetterlockscreen(){
	InstallYay
	yay --noconfirm -S betterlockscreen
}


########################################
#				Installing
########################################
updatePacman
installPackages

