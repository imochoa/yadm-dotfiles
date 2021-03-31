#!/usr/bin/env zsh

# ~/.zshenv - Should only contain user’s environment variables.

# From https://thevaluable.dev/zsh-install-configure-mouseless/

# Set the base directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"


# Editor
export EDITOR="nvim"
export VISUAL="nvim"


# ZSH env vars
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZPLUGINS="$XDG_CONFIG_HOME/zsh/plugins"


# --------------------------------------------------------------------------------
# HISTORY ENV VARS
# --------------------------------------------------------------------------------

# # History in cache directory:
# export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
# export HISTSIZE=10000                   # Maximum events for internal history
# export SAVEHIST=10000                   # Maximum events in history file

# # Ignore interactive commands from history
# export HISTORY_IGNORE="(ls|bg|fg|pwd|exit|cd ..)"


