#!/usr/bin/env bash

set -x

# housekeeping
sudo apt-get update
sudo apt-get -y upgrade
sudo apt -y full-upgrade
sudo apt-get -y autoremove

# install usuals
sudo apt-get -y -f install linux-headers-"$(uname -r)" \
  git g++ libssl-dev libncurses5-dev bc m4 make unzip libmnl-dev libssh-dev \
  bison cmake automake autoconf build-essential libpq-dev libffi-dev clang \
  curl wget libtool python python-pip cpio bzip2 gcc python3-ply ncurses-dev \
  python-yaml graphviz python-apt openssl fop xsltproc unixodbc-dev \
  python3-apt arduino gcc-avr avr-libc avrdude arduino-core arduino-mk \
  python-configobj python-jinja2 python-serial default-jdk squashfs-tools \
  ssh-askpass software-properties-common

# update package sources & keys
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc \
  | sudo apt-key add -
wget --quiet -O - \
  http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc \
  | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" \
  | sudo tee -a /etc/apt/sources.list
echo "deb http://packages.erlang-solutions.com/ubuntu trusty contrib" \
  | sudo tee -a /etc/apt/sources.list
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
gpg --keyserver hkp://keys.gnupg.net --recv-keys \
  409B6B1796C275462A1703113804BB82D39DC0E3
