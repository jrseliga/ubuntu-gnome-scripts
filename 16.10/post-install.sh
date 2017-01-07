#!/bin/bash
mkdir ~/.post-install
mkdir ~/.post-install/packages
mkdir ~/.post-install/archives

cd ~/.post-install

mkdir ~/.themes
mkdir ~/.fonts

# add the latest libre office
sudo add-apt-repository -y ppa:libreoffice/ppa

# update
sudo apt -y --force-yes update

# upgrade
sudo apt -y --force-yes dist-upgrade

# arc flatabulous theme
sudo add-apt-repository -y ppa:noobslab/themes

# clam
sudo add-apt-repository -y ppa:ubuntu-clamav/ppa

# chrome
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# kodi
sudo apt install software-properties-common
sudo add-apt-repository -y ppa:team-xbmc/unstable

# mssql server
#curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
#curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server.list | sudo tee /etc/apt/sources.list.d/mssql-server.list

# remmina
sudo add-apt-repository -y ppa:remmina-ppa-team/remmina-next

# smartgit hg
sudo add-apt-repository -y ppa:eugenesan/ppa

# sublime text 3
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

# telegram
sudo add-apt-repository -y ppa:atareao/telegram

# ultra flat icons
sudo add-apt-repository -y ppa:noobslab/icons

# update
sudo apt -y --force-yes update

# install packages
sudo apt -y install arc-flatabulous-theme
sudo apt -y install audacity
sudo apt -y install blender
sudo apt -y install chromium-browser
sudo apt -y install clamav
sudo apt -y install clamtk
sudo apt -y install deluge
sudo apt -y install fish
sudo apt -y install gimp
sudo apt -y install google-chrome-stable
sudo apt -y install gparted
sudo apt -y install inkscape
sudo apt -y install kodi
sudo apt -y install meld
#sudo apt -y install mssql-server
sudo apt -y install mysql-server
sudo apt -y install mysql-workbench
sudo apt -y install network-manager-vpnc
sudo apt -y install network-manager-vpnc-gnome
sudo apt -y install nginx
sudo apt -y install nodejs
sudo apt -y install php-fpm
sudo apt -y install php-mysql
sudo apt -y install openssh-server
sudo apt -y install remmina
sudo apt -y install smartgithg
sudo apt -y install sublime-text-installer
sudo apt -y install telegram
sudo apt -y install thunderbird
sudo apt -y install ultra-flat-icons

# dependencies missing?
sudo apt -y --force-yes install -f

# cleanup
sudo apt -y --force-yes remove --purge transmission
sudo apt -y --force-yes autoclean
sudo apt -y --force-yes autoremove

# symlink node to nodejs binary
sudo update-alternatives --install /usr/bin/node nodejs /usr/bin/nodejs 100

###################################
# install non repository packages #
###################################
cd ~/.post-install/packages

# install skype
wget -O "skype.deb" "https://go.skype.com/skypeforlinux-64-alpha.deb"
sudo dpkg -i skype.deb
sudo apt install -f -y
sudo dpkg -i skype.deb

# slack
wget -O "slack.deb" "https://downloads.slack-edge.com/linux_releases/slack-desktop-2.1.2-amd64.deb"
sudo dpkg -i slack.deb
sudo apt install -f -y
sudo dpkg -i slack.deb

# install synergy
wget -O "synergy.deb" "http://symless.com/files/packages/synergy-v1.8.6-stable-2ab21aa-Linux-x86_64.deb?v32"
sudo dpkg -i synergy.deb
sudo apt install -f -y
sudo dpkg -i synergy.deb

############################
# install themes and fonts #
############################
cd ~/.post-install/archives

# download arc os x themes for gnome 3.18
### The Arc Flatabulous theme is slightly more polished and has a PPA
### Leaving this here in case that project becomes abandoned
# wget -O "arcosxthemes.tar.gz" "https://drive.google.com/uc?export=download&id=0B41fzKDxVXKeVG81bHVkTWF0YWc"
# tar xvzf "arcosxthemes.tar.gz"
# cd "Arc-OSX-gnome 3.18"
# cp -R * ~/.themes/
# cd ~/.post-install/archives

# download fira code font
wget -O "firacode.zip" "https://github.com/tonsky/FiraCode/releases/download/1.203/FiraCode_1.203.zip"
unzip firacode.zip -d firacode
cp -R firacode ~/.fonts/

rm -rf ~/.post-install

# set global dark theme
sed -i 's/=0/=1/g' ~/.config/gtk-3.0/settings.ini

# configure gnome settings
gsettings set org.gnome.desktop.interface clock-format "24h"
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface font-name "Liberation Sans Narrow Condensed 11"
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Flatabulous-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Ultra-Flat"
gsettings set org.gnome.desktop.interface monospace-font-name "Liberation Mono Regular 11"
gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Liberation Sans Narrow Bold Condensed 11"

gsettings set org.gnome.nautilus.icon-view default-zoom-level "smallest"
gsettings set org.gnome.nautilus.list-view default-zoom-level "smallest"
gsettings set org.gnome.nautilus.list-view use-tree-view true
gsettings set org.gnome.nautilus.preferences default-folder-viewer "list-view"

gsettings set org.gnome.shell.extensions.user-theme name "Arc-Flatabulous-Dark"

gsettings set org.gnome.Vino authentication-methods "['vnc']"
gsettings set org.gnome.Vino enabled true
gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false
gsettings set org.gnome.Vino use-alternative-port true

# update bookmarks
echo "ssh://mysql2.agilesdesign.com:4368 mysql2" >> ~/.config/gtk-3.0/bookmarks
echo "dav://owncloud.seliga.me/remote.php/webdav owncloud" >> ~/.config/gtk-3.0/bookmarks
echo "ssh://web2.agilesdesign.com:4368 web2" >> ~/.config/gtk-3.0/bookmarks

# rename ~/.local/share/applications/telegramdesktop.desktop to telegram.desktop

chsh -s `which fish`
