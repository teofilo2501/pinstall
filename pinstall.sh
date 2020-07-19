#!/bin/bash
#add rpm fusion
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#add anydesk
cat > /etc/yum.repos.d/AnyDesk-Fedora.repo << "EOF" 
[anydesk]
name=AnyDesk Fedora - stable
baseurl=http://rpm.anydesk.com/fedora/$basearch/
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY
EOF

#add google-chrome
dnf install fedora-workstation-repositories
dnf config-manager --set-enabled google-chrome
dnf install google-chrome-stable -y

#download teamviewer
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm -O teamviewer.rpm

dnf update

#install packages
dnf install mc nmap wine megasync nautilus-megasync anydesk google-chrome-stable teamviewer.rpm kodi remmina remmina-plugins-rdp transmission-gtk 
