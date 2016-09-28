#!/bin/bash


cat EOF <<EOF

deb http://ftp.debian.org/debian jessie-backports main
deb https://apt.dockerproject.org/repo debian-jessie main

deb http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu trusty main
deb-src http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu trusty main

deb http://cran.rstudio.com/bin/linux/debian jessie-cran3/
EOF

sudo apt-get install -y make \
     firefox \
     firefox-esr \
     dpkg-dev \
     linux-headers-$(uname -r) \
     emacs \
     zeal \
     dpkg-reconfigure \
     python-pip \
     libxml2 libxslt \
     libxml2 \
     libxslt1.1 \
     libxml2-dev \
     libxslt1.1-dev \
     python-lxml \
     libnss3 \
     fontconfig-infinality \
     source-highlight \
     jq \
     nodejs \
     gconf2 libnotify4 libnss3 gvfs-bin xdg-utils libgnome-keyring0 gir1.2-gnomekeyring-1.0 \
     ncdu \
     keyboard-configuration \
     uuid \
     zip \
     awscli \
     python3-pip \
     ntp \
     gpg-agent \
     gnupg-agent \
     parcellite \
     vim-gtk \
     keychain \
     pass \
     htop \
     r-base \
     r-base-dev \
     offlineimap \
     notmuch notmuch-mutt \
     msmtp


#  sudo apt-get source linux-image-$(uname -r)
