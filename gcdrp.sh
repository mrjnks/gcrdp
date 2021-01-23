#! /bin/bash
# GCOLAB RDP SETUP
%%html
<marquee style='width: 30%; color: blue;'><b>RDP SETUP IN PROCESS, PLEASE WAIT.... Weeeeee</b></marquee> >&2
{
sudo -s
read -p "Choose username: " usrn
read -p "Choose password: " mypswd
useradd -m $usrn
adduser $usrn sudo
printf '%s:%s' $usrn $mypswd | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
apt update
sudo apt-get install --assume-yes wget
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
dpkg --install chrome-remote-desktop_current_amd64.deb
apt install --assume-yes --fix-broken
DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
apt install --assume-yes xscreensaver
systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg --install google-chrome-stable_current_amd64.deb
apt install --assume-yes --fix-broken
apt install nautilus nano -y 
adduser $usrn chrome-remote-desktop
} &> /dev/null &&
ipaddrs=$(curl ipecho.net/plain)
if sudo apt-get upgrade &> /dev/null
success="printf \n\n"All set. For reference, your IP is: $ipaddrs\"" >&2
then
printf 'Check https://remotedesktop.google.com/access/ \n\n'
    /bin/sh -c "$success"
else
    printf "\n\nError Occured " >&2
fi
