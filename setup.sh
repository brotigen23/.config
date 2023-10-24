#
#	Variables
#
xorgpkg=" xorg-server xorg-xinit xorg-xset xorg-xsetroot xorg-xrandr xorg-xrdb "

packages=" bspwm sxhkd dmenu polybar picom xfce4-terminal gnu-free-fonts feh "


#
#	Functions
#
updatePacman(){
	echo "Update pacman repo"
	sudo pacman --noconfirm -Syu
}

InstallPackages(){
	echo "Install xorg"
	#sudo pacman --noconfirm -S xorg xorg-init
	sudo pacman --noconfirm -S $xorgpkg

	echo "Install other packages"
	sudo pacman --noconfirm -S $packages
}

InstallYay(){
	echo "Install yay"
	git clone https://aur.archlinux.org/yay.git 
	cd ./yay || exit
	makepkg -sir --noconfirm
	cd ..
	rm -rf yay
}

InstallBetterlockscreen(){
	InstallYay
	yay --noconfirm -S betterlockscreen
}


#
#	Installing
#
