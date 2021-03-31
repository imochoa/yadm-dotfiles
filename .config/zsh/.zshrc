#!/usr/bin/env zsh

# .zshrc - Should be used for the shell configuration and for executing commands.

# Add to the path
fpath=(${XDG_CONFIG_HOME}/zsh/plugins $fpath)
fpath=(${XDG_CONFIG_HOME}/zsh/prompts $fpath)

##Zsh read these files in the following order:
#.zshenv - Should only contain user’s environment variables.
#.zprofile - Can be used to execute commands just after logging in.
#.zshrc - Should be used for the shell configuration and for executing commands.
#.zlogin - Same purpose than .zprofile, but read just after .zshrc.
#.zlogout - Can be used to execute commands when a shell exit.

# Look up!
# https://github.com/zdharma/zinit/blob/master/README.md
# https://thevaluable.dev/zsh-install-configure-mouseless/ 

# --------------------------------------------------------------------------------
# HISTORY OPTIONS
# --------------------------------------------------------------------------------

# History in cache directory:
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# Ignore interactive commands from history
export HISTORY_IGNORE="(ls|bg|fg|pwd|exit|cd ..)"
setopt histignorealldups sharehistory

# --------------------------------------------------------------------------------
# PROMPT OPTIONS
# --------------------------------------------------------------------------------

# Set up the prompt
autoload -Uz promptinit; promptinit
prompt adam1

# Custom prompt?
# autoload -Uz prompt_purification; prompt_purification



# --------------------------------------------------------------------------------
# COMPLETION OPTIONS
# --------------------------------------------------------------------------------

# Use modern completion system
CASE_SENSITIVE="false"
# setopt MENU_COMPLETE
setopt no_list_ambiguous
autoload -Uz compinit && compinit
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.
# compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
zstyle ':completion:*' menu yes select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'



# --------------------------------------------------------------------------------
### Added by Zinit's installer
# --------------------------------------------------------------------------------
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

# --------------------------------------------------------------------------------
### End of Zinit's installer chunk
# --------------------------------------------------------------------------------

# --------------------------------------------------------------------------------
# ALIASES 
# --------------------------------------------------------------------------------
# Load if they exist
[ -f "$HOME/.config/shell/aliases" ] && source "$HOME/.config/shell/aliases"

# --------------------------------------------------------------------------------
# FUNCTIONS
# --------------------------------------------------------------------------------
# Load if they exist
[ -f "$HOME/.config/zsh/zsh_functions" ] && source "$HOME/.config/zsh/zsh_functions"

# --------------------------------------------------------------------------------
# BASH COMPLETION
# --------------------------------------------------------------------------------
# # load bashcompinit for some old bash completions 
# # autoload bashcompinit && bashcompinit  
# autoload -U +X bashcompinit && bashcompinit
# # My LOCAL autocompletion files
# for bcfile in ~/.config/bash/bash_completion/* ; do
#   # [[ -r "$bcfile" ]] && source "$bcfile"
#   [ -r "$bcfile" ] && source "$bcfile"
# done

# # load bashcompinit for some old bash completions 
# autoload bashcompinit && bashcompinit  
# [[ -r ~/Projects/autopkg_complete/autopkg ]] && source ~/Projects/autopkg_complete/autopkg 

# --------------------------------------------------------------------------------
# PLUGINS
# --------------------------------------------------------------------------------

# Two regular plugins loaded without investigating.
# zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

# Plugin history-search-multi-word loaded with investigating.
zinit load zdharma/history-search-multi-word

# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# --------------------------------------------------------------------------------
# EDIT COMMAND LINE
# --------------------------------------------------------------------------------

# SET THE MODE
# Use emacs keybindings even if our EDITOR is set to vi
# # emacs mode
# bindkey -e
# vi mode
bindkey -v
export KEYTIMEOUT=1 # Speed up the switch between vim modes
autoload -Uz vim_mode_cursor; vim_mode_cursor # Change the cursor depending on the mode
autoload -Uz vim_keys_in_menu; vim_keys_in_menu # Use jkl; to navigate the selection menu 

# NEOVIM REMOTE
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
# export VISUAL="nvr -cc split --remote-wait +'setlocal bufhidden=wipe'"

# NEOVIM REMOTE /usr/local/bin/nvr (detect terminals within neovim) 
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  # INSIDE OF NEOVIM!
  export PS1="[nvr]$"
  # export PS1="[nvr]${PS1}\n"

  # Don't print massive paths in the NVR prompt...
  PROMPT_DIRTRIM=1

  # VISUAL can also be set by ~/.config/nvim/init.vim!  (dotfiles/nvim/after/general-settings.vim)
  # but this way the VISUAL & EDITOR env vars are updated
  export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'";
  alias v="nvr"
  alias vi="nvr"
  alias vim="nvr"
  alias nvim="nvr"
  alias neovim="nvr"
else
  export VISUAL="nvim"
  alias v="${VISUAL}"
  alias vi="${VISUAL}"
  alias vim="${VISUAL}"
  alias neovim="${VISUAL}"
fi

# # Propagate the results
# alias v="${VISUAL}"
# alias vi="${VISUAL}"
# alias vim="${VISUAL}"
# alias neovim="${VISUAL}"
export EDITOR="${VISUAL}"
