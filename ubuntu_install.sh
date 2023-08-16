#!/bin/bash

echo "Installing things for Pyenv"
sudo apt install build-essential libssl-dev zlib1g-dev \
     libbz2-dev libreadline-dev libsqlite3-dev curl \
      libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
curl https://pyenv.run | bash

apt install source-highlight


if [ -f "/proc/sys/fs/binfmt_misc/WSLInterop" ]; then
    echo "Installing WSL Specific dependencies"
    apt install xdg-utils wslu
fi
