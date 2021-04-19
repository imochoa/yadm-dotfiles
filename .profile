# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
# zsh loads ~/.zprofile at login, not ~/.profile

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


# THIS IS WHERE YOU SHOULD SET THE XDG PARAMS
# export XDG_CONFIG_HOME="$HOME/.config" # Default value anyway
# export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
# DON't MESS WITH THE CACHE DIR -> NAUTILUS NEEDS TO FIND THE ~/.cache/tracker/meta.db
# export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
