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
dnf install fedora-workstation-repositories -y
dnf config-manager --set-enabled google-chrome -y
dnf install google-chrome-stable -y

#download teamviewer
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm -O teamviewer.rpm

#add vscode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

#add sublimetext
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo -y

#update
dnf check-update -y
dnf update -y

#install packages
dnf install mc nmap wine megasync nautilus-megasync anydesk google-chrome-stable teamviewer.rpm kodi remmina remmina-plugins-rdp transmission-gtk code sublime-text -y
