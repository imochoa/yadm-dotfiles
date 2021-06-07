#!/usr/bin/env zsh

# ~/.zshenv - Should only contain user’s environment variables.

# From https://thevaluable.dev/zsh-install-configure-mouseless/

# --------------------------------------------------------------------------------
# Make sure the default home dir is set!
# --------------------------------------------------------------------------------
if [[ -z "$XDG_CONFIG_HOME" ]]
then
        export XDG_CONFIG_HOME="$HOME/.config"
else
  echo "XDG_CONFIG_HOME WAS NOT SET!"
fi

## 
#if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
#then
#        export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
#else
#  echo "NOT FOUND! $XDG_CONFIG_HOME/zsh"
#fi

#if [[ -z "$XDG_CONFIG_HOME" ]]
#then
#        export XDG_CONFIG_HOME="$HOME/.config"
#fi

#if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
#then
#        export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
#fi


# Set the base directory
# export XDG_CONFIG_HOME="$HOME/.config" # Default value anyway
# export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
# DON't MESS WITH THE CACHE DIR -> NAUTILUS NEEDS TO FIND THE ~/.cache/tracker/meta.db
# export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"


# --------------------------------------------------------------------------------
# ZSH ENV VARS
# --------------------------------------------------------------------------------
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# export ZPLUGINS="$XDG_CONFIG_HOME/zsh/plugins"
export ZDOTDIR="${HOME}/.config/zsh"
export ZPLUGINS="${HOME}/.config/zsh/plugins"


if [[ ! -d "$ZDOTDIR" ]]
then
    echo "ZDOTDIR NOT FOUND AT $ZDOTDIR"
fi

if [[ ! -d "$ZPLUGINS" ]]
then
    echo "ZPLUGINS NOT FOUND AT $ZPLUGINS"
fi

# --------------------------------------------------------------------------------
# HISTORY ENV VARS
# --------------------------------------------------------------------------------

# # History in cache directory:
# export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
# export HISTSIZE=10000                   # Maximum events for internal history
# export SAVEHIST=10000                   # Maximum events in history file

# # Ignore interactive commands from history
# export HISTORY_IGNORE="(ls|bg|fg|pwd|exit|cd ..)"

# # --------------------------------------------------------------------------------
# # LESS ENV VARS
# # --------------------------------------------------------------------------------
# SOURCEHLIGHT='/usr/share/source-highlight/src-hilite-lesspipe.sh'
# if [ ! -f "${SOURCEHLIGHT}" ]; then
#     echo "${SOURCEHLIGHT} not found!" >&2
#     # exit 1
# else
#  export LESSOPEN="| ${SOURCEHLIGHT} %s"
#  export LESS=' -R '
# fi

# --------------------------------------------------------------------------------
# EDITOR ENV VARS
# --------------------------------------------------------------------------------
export EDITOR="nvim"
export VISUAL="nvim"

