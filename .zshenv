#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#

# NOTE: .zshenv needs to live at ~/.zshenv, not in $ZDOTDIR!

# Set ZDOTDIR if you want to re-home Zsh.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/{,s}bin(N)
  $HOME/.local/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)
. "$HOME/.cargo/env"

# Java
[[ -x /usr/libexec/java_home ]] && /usr/libexec/java_home -v 17 &>/dev/null && export JAVA_17=$(/usr/libexec/java_home -v 17)
[[ -x /usr/libexec/java_home ]] && /usr/libexec/java_home -v 21 &>/dev/null && export JAVA_21=$(/usr/libexec/java_home -v 21)
export JAVA_HOME=${JAVA_21:-$JAVA_17}
