#!/bin/bash
#Colors
cyan='\e[0;36m'
lightcyan='\e[96m'
green='\e[0;32m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
blue='\e[1;34m'
Escape="\033";
white="${Escape}[0m";
RedF="${Escape}[31m";
GreenF="${Escape}[32m";
LighGreenF="${Escape}[92m"
YellowF="${Escape}[33m";
BlueF="${Escape}[34m";
CyanF="${Escape}[36m";
Reset="${Escape}[0m";
# Check root
[[ `id -u` -eq 0 ]] > /dev/null 2>&1 || { echo  $red "You must be root to run the script"; echo ; exit 1; }
clear

function checkinternet() 
{
  ping -c 1 google.com > /dev/null 2>&1
  if [[ "$?" != 0 ]]
  then
    echo -e $yellow " Checking For Internet: ${RedF}FAILED"
    echo
    echo -e $red "This Script Needs An Active Internet Connection"
    echo
    echo -e $yellow " HelperBoy Exit"
    echo && sleep 2
    exit
  else
    echo -e $yellow " Checking For Internet: ${LighGreenF}CONNECTED"
  fi
}
checkinternet
sleep 2

which python3 > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e $green "[ ✔ ] Python3.............................${LighGreenF}[ found ]"
which python3 > /dev/null 2>&1
sleep 2
else
echo ""
echo -e $red "[ X ] Python3 -> ${RedF}not found! "
sleep 2
echo -e $yellow "[ ! ] Installing Python3 "
sleep 2
echo -e $green ""
sudo apt-get install python3 -y
clear
echo -e $blue "[ ✔ ] Done installing .... "
which wget > /dev/null 2>&1
fi

which wget > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e $green "[ ✔ ] Wget.............................${LighGreenF}[ found ]"
which wget > /dev/null 2>&1
sleep 2
else
echo ""
echo -e $red "[ X ] Wget -> ${RedF}not found! "
sleep 2
echo -e $yellow "[ ! ] Installing Wget "
sleep 2
echo -e $green ""
sudo apt-get install  -y
clear
echo -e $blue "[ ✔ ] Done installing .... "
which wget > /dev/null 2>&1
fi

chmod +x helper
cp helper /usr/local/bin

echo -e $yellow "Now Just type helper in new terminal"
