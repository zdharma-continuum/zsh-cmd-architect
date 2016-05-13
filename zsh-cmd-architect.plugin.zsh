#!/usr/bin/env zsh

#
# No plugin manager is needed to use this file. All that is needed is adding:
#   source {where-znt-is}/zsh-cmd-architect.plugin.zsh
#
# to ~/.zshrc.
#

REPO_DIR="${0%/*}"
CONFIG_DIR="$HOME/.config/zca"

#
# Update FPATH if:
# 1. Not loading with Zplugin
# 2. Not having fpath already updated (that would equal: using other plugin manager)
#

if [[ -z "$ZPLG_CUR_PLUGIN" && "${fpath[(r)$REPO_DIR]}" != $REPO_DIR ]]; then
    fpath+=( "$REPO_DIR" )
fi

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
