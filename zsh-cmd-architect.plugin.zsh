#!/usr/bin/env zsh

REPO_DIR="${0%/*}"
CONFIG_DIR="$HOME/.config/zca"

#
# Copy configs
#

if ! test -d "$HOME/.config"; then
    mkdir "$HOME/.config"
fi

if ! test -d "$CONFIG_DIR"; then
    mkdir "$CONFIG_DIR"
fi

set h-list.conf zca.conf

for i; do
    if ! test -f "$CONFIG_DIR/$i"; then
        cp "$REPO_DIR/.config/zca/$i" "$CONFIG_DIR"
    fi
done

# Don't leave positional parameters being set
set --

#
# Load functions
#

autoload h-list zca zca-usetty-wrapper zca-widget
zle -N zca-widget
bindkey '^T' zca-widget

PATH="$PATH:$HOME/test"
FPATH="$FPATH:$HOME/tmp"

compdef test
