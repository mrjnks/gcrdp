#! /bin/bash
printf "Processing... " >&2
{
sudo -s
read -pr "Choose username: " "u_srn"
read -pr "Choose password: " "my_pswd"
useradd -m "$u_srn"
adduser "$u_srn" sudo
printf '%s:%s' "$u_srn" "$my_pswd" | sudo chpasswd
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
adduser "$u_srn" chrome-remote-desktop
} &> /dev/null &&
ipaddrs="$(curl ipecho.net/plain)"
if sudo apt-get upgrade &> /dev/null
s_uccess="printf \n\n"All set. For reference, your IP is: "$ipaddrs""" >&2
then
printf 'Check https://remotedesktop.google.com/access/ \n\n'
/bin/sh -c "s_uccess"
else printf "\n\nError Occured " >&2
fi
