PROMPT=$'%{\033[01;32m%}%n@%{\033[01;31m%}%m:%{\033[33;01;34m%}%~ %{\033[33;1m%}>%{\033[01;32m%}>%{\033[33;01;34m%}>%{\033[m%} '

# share history between sessions
setopt histignorealldups sharehistory

# save commands to a file immediately
setopt INC_APPEND_HISTORY

# Keep history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history

alias vim='nvim'

source <(fzf --zsh)

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
