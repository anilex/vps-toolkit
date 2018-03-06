#!/bin/bash
# Author: Patrick Samson
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
YELLOW='\e[93m'
RED='\e[91m'
ENDCOLOR='\033[0m'
CYAN='\e[96m'
GREEN='\e[92m'
SCRIPTPATH=$(pwd)

function pause(){
   read -p "$*"
}

clear
echo
echo -e $RED
echo -e "_    _   _ _  _ ____ ____ ____ _  _ ____ ____"
echo -e "|     \_/  |_/  |___ | __ |___ |\ | |___ [__ "
echo -e "|___   |   | \_ |___ |__] |___ | \| |___ ___]"
echo -e $CYAN
echo -e " __     ______  ____    _____           _ _    _ _   "
echo -e " \ \   / /  _ \/ ___|  |_   _|__   ___ | | | _(_) |_ "
echo -e "  \ \ / /| |_) \___ \    | |/ _ \ / _ \| | |/ / | __|"
echo -e "   \ V / |  __/ ___) |   | | (_) | (_) | |   <| | |_ "
echo -e "    \_/  |_|   |____/    |_|\___/ \___/|_|_|\_\_|\__|"
echo
echo -e $GREEN'Lykegenes '$SOFTNAME' Installer Script'$ENDCOLOR

echo
read -p 'Type y/Y and press [ENTER] to continue with the installation or any other key to exit: '
RESP=${REPLY,,}

if [ "$RESP" != "y" ]
then
    echo -e $RED'So you chickened out. May be you will try again later.'$ENDCOLOR
    echo
    pause 'Press [Enter] key to continue...'
    cd $SCRIPTPATH
    sudo ./setup.sh
    exit 0
fi

echo

echo -e $YELLOW'--->Refreshing packages list...'$ENDCOLOR
sudo apt-get update

echo
sleep 1

echo -e $YELLOW'--->Upgrading packages...'$ENDCOLOR
sudo apt-get -y upgrade

echo
sleep 1

echo -e $YELLOW"--->Setting server locales..."$ENDCOLOR
#sudo apt-get install -y language-pack-en-base
#sudo apt-get -y --reinstall install bsdutils
sudo locale-gen en_CA en_CA.UTF-8 en_US en_US.UTF-8
#sudo dpkg-reconfigure locales

echo
sleep 1

echo -e $YELLOW"--->Enabling passwordless sudo commands..."
sudo echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/NOPASSWD

echo
sleep 1


# Install ZSH
sudo apt-get install zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`
# In GCloud : sudo chsh someusername -s $(which zsh)

# Install custom Prezto theme
git clone --recursive https://github.com/lykegenes/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done


echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo ./setup.sh
exit 0