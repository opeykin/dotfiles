# Setup fzf
# ---------
if [[ ! "$PATH" == */home/opeykin/tools/fzf/bin* ]]; then
  export PATH="$PATH:/home/opeykin/tools/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/opeykin/tools/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------

if [ -f /home/opeykin/toolsfzf/shell/key-bindings.bash ]; then
  . /home/opeykin/toolsfzf/shell/key-bindings.bash
fi

if [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
  . /usr/share/fzf/shell/key-bindings.bash
fi

_HG_SL_FZF='hg sl --color=always | fzf --ansi --phony --reverse --height=50% | sed -E '"'"'s/.*[o@x]\s*([0-9a-f]+)\s.*/\1/'"'"

# Widget to insert hash at cursor
_hg_sl_fzf_widget() {
    local commit_hash
    commit_hash=$(eval "$_HG_SL_FZF")
    READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}${commit_hash}${READLINE_LINE:$READLINE_POINT}"
    READLINE_POINT=$((READLINE_POINT + ${#commit_hash}))
}

# Function to select and checkout
hg_checkout_fzf() {
    local commit_hash
    commit_hash=$(eval "$_HG_SL_FZF")
    if [[ -n "$commit_hash" ]]; then
        hg checkout "$commit_hash"
    fi
}

# Widget to checkout selected commit
_hg_checkout_fzf_widget() {
    hg_checkout_fzf
    # Refresh the prompt after checkout
    READLINE_LINE=""
    READLINE_POINT=0
}

# Bind Ctrl+g to insert hash
bind -x '"\C-g": _hg_sl_fzf_widget'

# Bind Ctrl+o to checkout
bind -x '"\C-o": _hg_checkout_fzf_widget'
