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

SOFTNAME='Simp_le Lets\' Encrypt Client'

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
echo -e $CYAN"You might need to stop some services in low-memory environments..."$ENDCOLOR
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

echo -e $YELLOW"--->Installing "$SOFTNAME"..."$ENDCOLOR
# Clone
cd /opt
sudo git clone https://github.com/kuba/simp_le
cd simp_le
 
# Install
sudo ./bootstrap.sh
sud0 ./venv.sh
sudo ln -s $(pwd)/venv/bin/simp_le /usr/local/sbin/simp_le

echo
sleep 1

echo -e $YELLOW"--->Creating SSL Certificates folder..."$ENDCOLOR
sudo mkdir /certs
sudo chown -R :www-data /certs
echo -e $CYAN'/certs/'$ENDCOLOR ' - Folder created; put your SSL Certs in there'

echo
sleep 1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
simp_le --version
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo ./setup.sh
exit 0