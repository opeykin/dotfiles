# share history between sessions
setopt histignorealldups sharehistory

# save commands to a file immediately
setopt INC_APPEND_HISTORY

# Keep history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history


# ---------------- VI mode stuff --------------------------

# Enable vi mode
bindkey -v

PROMPT_BASE=$'%{\033[01;32m%}%n@%{\033[01;31m%}%m:%{\033[33;01;34m%}%~ %{\033[33;1m%}>%{\033[01;32m%}>%{\033[33;01;34m%}>%{\033[m%} '
CMD_PROMPT=$'%{\033[33;01m%}(cmd)%{\033[m%} '"${PROMPT_BASE}"
INS_PROMPT=$'%{\033[01;32m%}(ins)%{\033[m%} '"${PROMPT_BASE}"

# Function to change prompt based on vi mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    # Normal/command mode with yellow 'cmd'
    PROMPT="${CMD_PROMPT}"
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ $1 = 'beam' ]]; then
    # Insert mode 
    PROMPT="${INS_PROMPT}"
  fi
  zle reset-prompt
}

# Initialize prompt on new line
function zle-line-init {
  PROMPT="${INS_PROMPT}"
  zle reset-prompt
}

# Register the functions as widgets
zle -N zle-keymap-select
zle -N zle-line-init




alias vim='nvim'

source <(fzf --zsh)

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
