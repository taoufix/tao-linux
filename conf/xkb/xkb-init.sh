#!/usr/bin/env bash


# User gnome-session-properties to add this script to initialisation

[[ -f ~/.xkb/keymap/mykbd ]] && xkbcomp -I$HOME/.xkb ~/.xkb/keymap/mykbd $DISPLAY > /dev/null 2>&1

