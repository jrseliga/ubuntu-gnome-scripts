#!/bin/bash

echo -n "Do you want to install these programs?"
echo -n " "

echo -n "Audacity (y/n):"
read audacity

echo -n "Blender (y/n):"
read blender

echo -n "Darktable (y/n):"
read darktable

echo -n "LMMS (y/n):"
read lmms

echo -n "KdenLive (y/n):"
read kdenlive

echo -n "Kodi (y/n):"
read kodi

echo -n "Krita (y/n):"
read krita

echo -n "Network Manager VPNC (y/n):"
read nmvpnc

echo -n "Pinta (y/n):"
read pinta

echo -n "Popcorn Time (y/n):"
read popcorntime

echo -n "Rawtherapee (y/n):"
read rawtherapee

# update
sudo apt-get -y --force-yes update

# upgrade
sudo apt-get -y --force-yes dist-upgrade

# atom
sudo add-apt-repository -y ppa:webupd8team/atom

# brackets
sudo add-apt-repository -y ppa:webupd8team/brackets

# california
sudo add-apt-repository -y ppa:yorba/daily-builds

# clam
sudo add-apt-repository -y ppa:ubuntu-clamav/ppa

# chrome
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# darktable
if echo "$darktable" | grep -iq "^y" ;then
	sudo add-apt-repository -y ppa:pmjdebruijn/darktable-release
fi

# firefox developer edition
sudo add-apt-repository -y ppa:ubuntu-mozilla-daily/firefox-aurora

# kdenlive
if echo "$kdenlive" | grep -iq "^y" ;then
	sudo add-apt-repository -y ppa:sunab/kdenlive-release
fi

# kodi
if echo "$kodi" | grep -iq "^y" ;then
	sudo apt-get install software-properties-common
	sudo add-apt-repository -y ppa:team-xbmc/ppa
fi

# monodevelop
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list

# numix
# sudo add-apt-repository -y ppa:numix/ppa

# pinta
if echo "$pinta" | grep -iq "^y" ;then
    sudo add-apt-repository -y ppa:pinta-maintainers/pinta-stable
fi

# popcorn time
if echo "$popcorntime" | grep -iq "^y" ;then
    sudo add-apt-repository -y ppa:webupd8team/popcorntime
fi

# rawtherapee
if echo "$rawtherapee" | grep -iq "^y" ;then
	sudo add-apt-repository -y ppa:dhor/myway
fi

# remmina
sudo add-apt-repository -y ppa:remmina-ppa-team/remmina-next

# skype
sudo sh -c "echo 'deb http://archive.canonical.com/ubuntu/ utopic partner' >> /etc/apt/sources.list.d/canonical_partner.list"

# smartgit hg
sudo add-apt-repository -y ppa:eugenesan/ppa

# sublime text 3
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

# telegram
sudo add-apt-repository -y ppa:atareao/telegram

# update
sudo apt-get -y --force-yes update

if echo "$audacity" | grep -iq "^y" ;then
	sudo apt-get -y install audacity
fi

sudo apt-get -y install atom
if echo "$blender" | grep -iq "^y" ;then
	sudo apt-get -y install blender
fi
sudo apt-get -y install brackets
sudo apt-get -y install california
sudo apt-get -y install chromium-browser
sudo apt-get -y install clamav
sudo apt-get -y install clamtk

if echo "$darktable" | grep -iq "^y" ;then
	sudo apt-get -y install darktable
fi

sudo apt-get -y install deluge
sudo apt-get -y install firefox
sudo apt-get -y install fish
sudo apt-get -y install gimp
sudo apt-get -y install gnome-maps
sudo apt-get -y install gnome-screenshot
sudo apt-get -y install gnome-system-log
sudo apt-get -y install gnome-system-monitor
sudo apt-get -y install gnome-tweak-tool
sudo apt-get -y install gnome-weather
sudo apt-get -y install google-chrome-stable
sudo apt-get -y install gparted
sudo apt-get -y install inkscape

if echo "$kodi" | grep -iq "^y" ;then
	sudo apt-get -y install kodi
fi

if echo "$kdenlive" | grep -iq "^y" ;then
	sudo apt-get -y install kdenlive
fi

if echo "$krita" | grep -iq "^y" ;then
	sudo apt-get -y install krita
fi

sudo apt-get -y install libreoffice

if echo "$lmms" | grep -iq "^y" ;then
	sudo apt-get -y install lmms
fi

sudo apt-get -y install meld
sudo apt-get -y install monodevelop monodevelop-nunit monodevelop-versioncontrol monodevelop-database
sudo apt-get -y install mysql-workbench

if echo "$nmvpnc" | grep -iq "^y" ;then
	sudo apt-get -y install network-manager-vpnc
fi

#sudo apt-get -y install numix-icon-theme-circle
#sudo apt-get -y install numix-gtk-theme
sudo apt-get -y install openssh-server

if echo "$pinta" | grep -iq "^y" ;then
	sudo apt-get -y install pinta
fi

if echo "$popcorntime" | grep -iq "^y" ;then
	sudo apt-get -y install popcorn-time
fi

if echo "$rawtherapee" | grep -iq "^y" ;then
	sudo apt-get -y install rawtherapee
fi

sudo apt-get -y install remmina remmina-plugin-rdp
sudo apt-get -y install skype
sudo apt-get -y install smartgithg
sudo apt-get -y install sublime-text-installer
sudo apt-get -y install synergy
sudo apt-get -y install telegram
#sudo apt-get -y install thunderbird

# dependencies missing?
sudo apt-get -y --force-yes install -f

# cleanup
sudo apt-get -y --force-yes remove --purge transmission
sudo apt-get -y --force-yes autoclean
sudo apt-get -y --force-yes autoremove

# mysql workbench workaround
#wget http://launchpadlibrarian.net/167351511/python-paramiko_1.10.1-1git1build1_all.deb
#sudo dpkg -i python-paramiko_1.10.1-1git1build1_all.deb
#sudo rm -rf python-paramiko_1.10.1-1git1build1_all.deb
#echo python-paramiko hold | sudo dpkg --set-selections

sudo reboot now
