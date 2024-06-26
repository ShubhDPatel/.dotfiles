

# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILESIZE=100000
HISTSIZE=10000

shopt -s histappend
shopt -s checkwinsize
shopt -s extglob
shopt -s globstar
shopt -s checkjobs

alias ll='ls -l'

if [[ ! -v BASH_COMPLETION_VERSINFO ]]; then
  . "/nix/store/80w98qbaxwyrd0wisi5zd0yqjyrh4pbs-bash-completion-2.11/etc/profile.d/bash_completion.sh"
fi

export PATH="/etc/profiles/per-user/$USER/bin/cmake-3.29.0-linux-x86_64/bin:$PATH"

eval "$(starship init bash)"

