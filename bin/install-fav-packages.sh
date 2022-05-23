#!/usr/bin/env bash

packages=(
    curl
    emacs-nox
    fzf
    inetutils-traceroute
    jq
    net-tools
    strace
    tmux
    yaml-mode # yaml mode for emacs
    yamllint
    python3
    python3-pip
)

sudo apt-get install --upgrade ${packages[@]}


pip_packages=(
    bpytop
)

pip3 install --upgrade ${pip_packages[@]}
