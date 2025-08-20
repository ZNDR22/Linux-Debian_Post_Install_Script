#!/bin/bash
# ---------------------
# Run with sudo bash post_install.sh
# ---------------------
if [ "$(id -u)" -ne 0 ]; then
	echo 'This script must be run by root' >&2
	exit 1
fi
# --------------------
apt update && apt upgrade
# --------------------
# rm /etc/apt/sources.list.d/repositories.list
# echo "repository" >> /etc/apt/sources.list.d/repositories.list
cd ~
apt install curl
        curl -fsS https://dl.brave.com/install.sh | sh
apt install git
        git clone https://github.com/dylanaraps/neofetch ~/bin/neofetch
                cd ~/bin/neofetch
                        make install
                cd ~
# --------------------
while true; do
        read -p "Would you like to install OSINT tool packages? [Y/N]" yn
        case $yn in
                [Yy]* )
			git clone http://github.com/exiftool/exiftool ~/toolkit/osint/exiftool
                                apt install exiftool
                break;;
                [Nn]* ) break;;
                * ) echo "Invalid response";;
        esac
done
# --------------------
while true; do
        read -p "Would you like to install Debian Astro packages? [Y/N]" yn
        case $yn in
                [Yy]* )
                        apt install astro-all
                break;;
                [Nn]* ) break;;
                * ) echo "Invalid response";;
        esac
done

# --------------------
apt update && apt upgrade
# --------------------
echo POST INSTALL COMPLETE
echo  
neofetch

