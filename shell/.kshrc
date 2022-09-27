# History in cache directory:
HISTFILE=$HOME/.cache/ksh/history
HISTSIZE=20000

# ohmyksh needs to know where it lives, so we tell it via this env var:
OHMYKSH_DIR=${HOME}/.local/src/ohmyksh

# Now we can load everything up!
. ${OHMYKSH_DIR}/ohmy.ksh

# All the paths we use (in order!)
set -A my_paths -- \
        /usr/ports/infrastructure/bin \
        ~/.local/bin \
        ~/.go/bin \
        /usr/local/plan9/bin

paths "${my_paths[@]}"

# Load completions
load_completion git
load_completion man
load_completion mpc
load_completion ssh

# Load extensions
load_extension fzf

alias vi=vim
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && . "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# the q prompt auto-loads the git-prompt extension
set_prompt q
